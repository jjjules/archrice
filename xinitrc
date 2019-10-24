setxkbmap -model thinkpad -layout ch -variant fr 	# Set Keyboard Layout
xinput set-prop 11 301 1 													# Enable Tap on Touchpad
xinput set-prop 11 309 1 													# Enable Natural Scroll
/home/jules/scripts/escaps												# Exchange caps and escape

feh --no-fehbg --bg-center ~/pics/fractal_wp/342753.jpg
unclutter &
dunst &
xset dpms 300 300 300
xss-lock -l -- $HOME/scripts/lockscreen &
exec i3
