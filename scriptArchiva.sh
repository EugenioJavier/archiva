!# /bin/bash

# script de levantamiento de archiva
echo entro en el script
./archiva console &

# probablemente habrá que hacer alguna rutina para esperar a que archiva se levante
sleep 10
sleep 10
sleep 10
sleep 10
sleep 10
sleep 10
#curl con comando para añadir un usuario
curl -H "Authorization: Basic YWRtaW46aG95dWVsYXMx>" -H "Content-Type: application/json" -X POST -d '{
        "username": "admin",
        "fullName": "ooG",
        "email": "uOnnn@email.com",
        "validated": false,
        "locked": false,
        "password": "conrase1",
        "passwordChangeRequired": true,
        "permanent": true,
        "confirmPassword": null,
        "timestampAccountCreation": "Tue, 3 Nov 2015 16:54:45 +0000 - 19 minutes ago",
        "timestampLastLogin": null,
        "timestampLastPasswordChange": "Tue, 3 Nov 2015 16:54:45 +0000 - 19 minutes ago",
        "previousPassword": null,
        "assignedRoles": null,
        "readOnly": false,
        "userManagerId": "ttt"
    }' http://localhost:8080/restServices/redbackServices/userService/createAdminUser
#informamos de la creación del usuario

echo usuario creado

#terminamos

exit
