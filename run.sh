#!/bin/bash

REMCONF='https://raw.githubusercontent.com/dudoslav/guocci-web-ui/master/app/app.request.options.ts'
LOCCONF="$HOME/guocci-web-ui/app/app.request.options.ts"

if [ ! -z "$HOSTIP" ]; then
	wget -q $REMCONF -O $LOCCONF
	sed -ie "s/guocci-mock-server.herokuapp.com/$HOSTIP/g" $LOCCONF;
fi

cd /home/guocci/guocci-web-ui
npm run start
