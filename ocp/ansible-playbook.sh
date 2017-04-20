#!/bin/sh

msg="Please key-in one of the options"

while true; do
    read -p "Which operation do you want to perform?
    1. Install OpenShift Container Platform
    2. Start OpenShift Container Platform
    3. Stop OpenShift Container Platform
    4. Remove OpenShift Container Platform
    5. Install CDK
    6. Install OpenShift Origin
    7. Remove OpenShift Origin
    x. To Quit
    -----------------------------------------------------------
    ${msg}
    -----------------------------------------------------------

    " -n 1 ip
    case $ip in
        1) echo "\n"; ansible-playbook -v -i hosts site.yml --tags "ocp-install"; break;;
        2) echo "\n"; ansible-playbook -v -i hosts site.yml --tags "ocp-start"; break;;
        3) echo "\n"; ansible-playbook -v -i hosts site.yml --tags "ocp-stop"; break;;
        4) echo "\n"; ansible-playbook -v -i hosts site.yml --tags "ocp-remove"; break;;
        5) echo "Feature not yet available"; break;;
        6) echo "\n"; ansible-playbook -v -i hosts site.yml --tags "origin-install"; break;;
        7) echo "\n"; ansible-playbook -v -i hosts site.yml --tags "origin-remove"; break;;
        [xX]*) exit;;
        * ) echo "\n"; echo "${msg}";;
    esac
done
