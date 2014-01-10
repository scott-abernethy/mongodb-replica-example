db = db.getSiblingDB('admin');
db.addUser( { user: "admin", pwd: "1234", roles: [ "userAdminAnyDatabase", "dbAdminAnyDatabase", "readAnyDatabase", "clusterAdmin" ], otherDBRoles: { config: [ "readWrite" ], local: [ "readWrite" ] } } );
