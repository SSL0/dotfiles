Config { font    = "xft:Mononoki Nerd Font:pixelsize=12:antialias=true:hinting=true"
       , additionalFonts = [ "xft:FontAwesome:pixelsize=13", "xft:Ubuntu:weight=bold:pixelsize=11:antialias=true:hinting=true" ]
       , bgColor = "#292d3e"
       , fgColor = "#B45BCF"
       , position = Static { xpos = 0 , ypos = 0, width = 1920, height = 24 }
       , lowerOnStart = True
       , hideOnStart = False
       , allDesktops = True
       , persistent = True
       , iconRoot = "/home/am/.xmonad/xpm/"
       , commands = [ 
                      -- Time and date
                      Run Date "\xf133 %b %d %Y (%H:%M)" "date" 50
                      -- Network up and down
                    , Run Network "wlp0s29u1u6" ["-t", "\xf0aa <rx>kb  \xf0ab <tx>kb"] 20
                      -- Cpu usage in percent
                    , Run Cpu ["-t", "\xf108 cpu: (<total>%)","-H","50","--high","red"] 20
                      -- Ram used number and percent
                    , Run Memory ["-t", "\xf233 mem: <used>M (<usedratio>%)"] 20
                      -- Disk space free
                    , Run DiskU [("/", "\xf0c7 hdd: <free> free")] [] 60
                      -- Runs custom script to check for pacman updates.
                      -- This script is in my dotfiles repo in .local/bin.
                    , Run Com "pacupdate" [] "" 36000
                      -- Runs a standard shell command 'uname -r' to get kernel version
                    , Run Com "uname" ["-r"] "" 36000
                      -- Prints out the left side items such as workspaces, layout, etc.
                      -- The workspaces are 'clickable' in my configs.
                    , Run UnsafeStdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " <icon=haskell_20.xpm/> <fc=#666666>|</fc> %UnsafeStdinReader% }{ <fc=#b3afc2> %uname% </fc><fc=#666666>| </fc><fc=#FFB86C>%cpu% </fc><fc=#666666>| </fc><fc=#FF5555>%memory% </fc><fc=#666666>| </fc><fc=#82AAFF>%disku% </fc><fc=#666666>| </fc><fc=#c3e88d>%enp6s0% </fc><fc=#666666>| </fc><fc=#e1acff> %pacupdate%</fc><fc=#666666>| </fc><fc=#8BE9FD>%date%</fc> "
       }

