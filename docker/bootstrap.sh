#!/bin/bash

BACKEND_DIR=/chatgpt-web/backend
FRONTEND_DIR=/chatgpt-web/frontend

if [[ -z "${OPENAI_API_KEY}" ]];then
	echo "Environment variable 'OPENAI_API_KEY' cannot be empty!"
	exit 1
fi

cd ${BACKEND_DIR}
nohup pnpm prod > backend.out 2>&1 &

cd ${FRONTEND_DIR}
exec http-server -p 3000
