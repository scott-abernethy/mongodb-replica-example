## MongoDB replication example
An working example of mongoDB replication with:
- 3 node replica set, using [primary with a secondary and an arbiter](http://docs.mongodb.org/manual/core/replica-set-architecture-three-members/) setup
- keyfile authentication between nodes
- cluster admin and user accounts

### Usage
1. Install [Vagrant](www.vagrantup.com)
2. In the project root do: 

    ```bash
    vagrant up
    ```

