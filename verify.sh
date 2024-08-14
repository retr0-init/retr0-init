#!/bin/bash

RAND_STRING=$(mktemp -u XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX)
echo "Send the following message to the person and ask for decrypted one:"
echo "${RAND_STRING}" | gpg -e -a -f $1
echo
read -r -p "Paste the decrypted message: " decrypted_msg
if [ "$decrypted_msg" = "$RAND_STRING" ]; then
	echo "The decryptd message is $decrypted_msg"
	echo "The original message is $RAND_STRING"
	echo "Verified at $(date -u)"
else
	echo "The original message is $RAND_STRING"
	echo "Failed at $(date -u)"
fi
