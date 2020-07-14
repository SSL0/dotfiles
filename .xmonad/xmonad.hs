-- Base 
import System.IO (hPutStrLn)
import System.Exit (exitSuccess)

import XMonad

-- Windows
import XMonad.Actions.CopyWindow (kill1)

-- Layouts
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.SimpleFloat
import XMonad.Layout.ResizableTile

import XMonad.Layout.Spacing  -- Gaps
import XMonad.Layout.NoBorders
import XMonad.Layout.BorderResize

-- Hooks
import XMonad.Hooks.ManageDocks (avoidStruts, manageDocks, docksEventHook)
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)
import XMonad.Hooks.ToggleHook
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.WorkspaceHistory
import XMonad.Hooks.EwmhDesktops 
-- Keybindings
import XMonad.Util.EZConfig

import qualified Data.Map as M
import qualified XMonad.StackSet as W

-- TreeSelect
import Data.Tree
import XMonad.Actions.TreeSelect
import qualified XMonad.StackSet as W
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)


import XMonad.Actions.WindowNavigation (withWindowNavigation)

myWorkspaces :: [String]
myWorkspaces = ["web","dev","media","file","torrent"] ++ map show [6..9]


-- Keybindings 
myKeys :: [(String, X ())]
myKeys = [
        -- Controls
          ("M-S-e", io exitSuccess) -- Exit xmonad
        , ("M-S-r", spawn "xmonad --restart") -- Restart xmonad
        , ("M-S-c", spawn "xmonad --recompile") -- Recompile xmonad
        , ("M-S-q", kill1)
        , ("M-f", sendMessage ToggleLayout)
        , ("M-<Tab>", sendMessage NextLayout)

        -- Resize
        , ("M-C-h", sendMessage $ Shrink)
        , ("M-C-j", sendMessage $ MirrorShrink)
        , ("M-C-k", sendMessage $ MirrorExpand)
        , ("M-C-l", sendMessage $ Expand)
        -- Apps
        , ("M-<Space>", spawn "rofi -show run")
        , ("M-<Return>", spawn "alacritty")
        -- Screenshot
        , ("M-S-s", spawn "~/.xmonad/scripts/screenshot.sh")

        -- Volume
        , ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%")
        , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%")
        , ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
        -- Player
        , ("<XF86AudioPlay>", spawn "playerctl play-pause")
        , ("<XF86AudioPause>", spawn "playerctl play-pause")
        , ("<XF86AudioNext>", spawn "playerctl next")
        , ("<XF86AudioPrev>", spawn "playerctl previous")
    ]

-- Autostart
startup :: X ()
startup = do
    spawn "feh --bg-scale /usr/share/backgrounds/galaxy.jpg &"
    spawn "picom --experimental-backends --config ~/.config/picom/picom.conf &"
    spawn "setxkbmap -layout us,ru -option 'grp:caps_toggle' &"
    spawn "xautolock -locker i3lock-fancy -time 10 &"
    -- Tray
    spawn "nm-applet &"
    spawn "dunst &"
    spawn "blueman-applet &"
    spawn "caffeine"

    -- Volume
    spawn "killall pa-applet"
    spawn "pa-applet &"

    spawn "~/.config/polybar/launch.sh"

tall = ResizableTall 1 (1/100) (1/2) [] 

-- Main configuration
main :: IO()
main = do
    -- xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
    config <- withWindowNavigation(xK_k, xK_h, xK_j, xK_l) $ def {   
          terminal = "alacritty"
        , modMask = mod4Mask
        , workspaces = myWorkspaces
        , borderWidth = 3
        , normalBorderColor = "#3c3c3c"
        , focusedBorderColor = "#ada8a8"
        , startupHook = startup
        , layoutHook = smartBorders . borderResize . avoidStruts . smartSpacing 5 . toggleLayouts(noBorders Full) $ tall ||| Mirror tall 
        -- Xmobar
        , handleEventHook = docksEventHook
        , manageHook = manageDocks <+> (isFullscreen --> doFullFloat) <+> manageHook defaultConfig
        -- , logHook = dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn xmproc }
    } `additionalKeysP` myKeys 
    xmonad config
