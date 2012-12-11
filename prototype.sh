ENVROOT="${HOME}/.env"
DEVROOT="${HOME}/Development"
VENV2="/usr/local/share/python/virtualenv-2.7"
VENV3="/usr/local/share/python3/virtualenv-3.2"

function workon {
    if [ -z "$1" ]; then
        echo "A project name is required"
        return 1
    fi
    
    mkdir -p ${DEVROOT}/${1} 2>&1 >/dev/null
    if [ "$2" == "-py3" ]; then
        source ${ENVROOT}/${1}-py3/bin/activate
    else
        source ${ENVROOT}/${1}/bin/activate
    fi
    cd ${DEVROOT}/${1}/
}

function mkenv {
    if [ -z "$1" ]; then
        echo "A project name is required"
        return 1
    fi
    
    if [ "$2" == "-py3" ];then
        $VENV3 --no-site-packages ${ENVROOT}/${1}-py3/
    else
        $VENV2 --no-site-packages ${ENVROOT}/${1}/
    fi
    workon $1 $2
}
