#!/usr/bin/dumb-init /bin/bash
echo -e "TELEGRAM_TRANSMISSION_BOT='${TELEGRAM_TRANSMISSION_BOT}'\nTELEGRAM_USERNAME='${TELEGRAM_USERNAME}'\nTRANSMISSION_URL='${TRANSMISSION_URL}'\nTRANSMISSION_USERNAME='${TRANSMISSION_USERNAME}'\nPASS='${PASS}'"
exit=0
[ "x" != "x${TELEGRAM_TRANSMISSION_BOT}" ] || (echo "Variable TELEGRAM_TRANSMISSION_BOT is unset. Please fix"; let exit++)
[ "x" != "x${TELEGRAM_USERNAME}" ] || (echo "Variable TELEGRAM_USERNAME is unset. Please fix"; let exit++)
[ "x" != "x${TRANSMISSION_URL}" ] || (echo "Variable TRANSMISSION_URL is unset. Please fix"; let exit++)
[ "x" != "x${TRANSMISSION_USERNAME}" ] || (echo "Variable TRANSMISSION_USERNAME is unset. Please fix"; let exit++)
[ "x" != "x${PASS}" ] || (echo "Variable PASS is unset. Please fix"; let exit++)
if [ $exit -ge 1 ]; then exit $exit; fi
for i in ${TELEGRAM_USERNAME}; do
    MASTER="-master=${i} ${MASTER}"
done
echo OK
/bin/transmission-telegram -token=${TELEGRAM_TRANSMISSION_BOT} ${MASTER} -url=${TRANSMISSION_URL} -username=${TRANSMISSION_USERNAME} -password=${PASS}