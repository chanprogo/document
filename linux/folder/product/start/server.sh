#/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

PORT=7099
service_PID=$(netstat -anput | grep LISTEN | grep $PORT | awk '{printf $7}' | cut -d/ -f1)

CURRENTLY_PATH=$(readlink -f $0)
CURRENTLY_DIR=$(dirname ${CURRENTLY_PATH})
server_DIR=$CURRENTLY_DIR

if [[ $1 = 'stop' ]]; then
    cd $server_DIR

    # kill -9  $service_PID
    npm run stop

    sleep 3
    stop_PID=$(netstat -anput | grep LISTEN | grep $PORT | awk '{printf $7}' | cut -d/ -f1)
    echo "$(date -d today +'%Y-%m-%d %H:%M:%S')"
    if [ -z $stop_PID ]; then
        echo "::::: stop  done.... "
    else
        echo "::::: kill -9 $service_PID......."
        kill -9 $service_PID
    fi

elif [[ $1 = 'start' ]]; then
    if [ -z $service_PID ]; then
        echo "$(date -d today +'%Y-%m-%d %H:%M:%S')::::: run npm start"
        cd $server_DIR
        run=$(EGG_SERVER_ENV=$2 npm run start)
        echo $(date -d today +'%Y-%m-%d %H:%M:%S')::::: run: ${run}
        echo $(date -d today +'%Y-%m-%d %H:%M:%S')::::: sleep2
        sleep 2
        service_idt=$(netstat -anput | grep LISTEN | grep $PORT | awk '{printf $7}' | cut -d/ -f1)
        echo "$(date -d today +'%Y-%m-%d %H:%M:%S')"
        if [ -z $service_idt ]; then
            echo "::::: start $service_idt failed ,pless check debug.log!!!"
        else
            echo "::::: start $service_idt success!! "
        fi
    else
        echo "$(date -d today +'%Y-%m-%d %H:%M:%S')::::: server id $service_PID is already run"
    fi

elif [[ $1 = 'restart' ]]; then
    if [ -z $service_PID ]; then
        echo "$(date -d today +'%Y-%m-%d %H:%M:%S')::::: check $service is no running. Run $2 npm run start"
        cd $server_DIR
        run=$(EGG_SERVER_ENV=$2 npm run start)
        echo $(date -d today +'%Y-%m-%d %H:%M:%S')::::: run:${run}
        echo $(date -d today +'%Y-%m-%d %H:%M:%S')::::: sleep2
        sleep 2
        service_idt=$(netstat -anput | grep LISTEN | grep $PORT | awk '{printf $7}' | cut -d/ -f1)
        echo "$(date -d today +'%Y-%m-%d %H:%M:%S')"
        if [ -z $service_idt ]; then
            echo "::::: start $service_PID failed ,pless check debug.log!!!"
        else
            echo "::::: start $service_PID success!! "
        fi
    else
        echo "$(date -d today +'%Y-%m-%d %H:%M:%S')::::: check service pid  $service_PID is running. Kill servier id $service_PID"      
        cd $server_DIR
        npm run stop
        echo $(date -d today +'%Y-%m-%d %H:%M:%S')::::: sleep 3
        sleep 3
        service_kPID=$(netstat -anput | grep LISTEN | grep $PORT | awk '{printf $7}' | cut -d/ -f1)
        if [ -z $service_kPID ]; then
            echo "$(date -d today +'%Y-%m-%d %H:%M:%S')::::: recheck $service_kPID is no running"
            cd $server_DIR
            run=$(EGG_SERVER_ENV=$2 npm run start)
            echo $(date -d today +'%Y-%m-%d %H:%M:%S')::::: run:${run}
            echo $(date -d today +'%Y-%m-%d %H:%M:%S')::::: sleep 3
            sleep 3
            service_tPID=$(netstat -anput | grep LISTEN | grep $PORT | awk '{printf $7}' | cut -d/ -f1)
            echo "$(date -d today +'%Y-%m-%d %H:%M:%S')"
            if [ -z $service_tPID ]; then
                echo "::::: start $service_tPID failed ,pless check debug.log!!!"
            else
                echo "::::: restart newid is $service_tPID success!! "
            fi
        else
            echo "$(date -d today +'%Y-%m-%d %H:%M:%S')::::: pid is $service_kPID "
        fi
    fi
else
    echo "please input './service.sh stop |start |restart' "
fi
