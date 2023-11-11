workspace {
    
    !identifiers hierarchical
    
    model {
        user = person "User"
    
        softwareSystem = softwareSystem "eCommerce System"{

            interface = container "User Interface" "React Native"

            userService = group "User Service" {
                userServiceApi = container "User Service backend" "Kotlin\n"{
                    tags "User Service" "Backend"
                }
                container "User Service Database" {
                    tags "User Service" "Database"
                    userServiceApi -> this "Reads from and writes to"
                }
            }

            ordersService = group "Order Service" {
                ordersServiceApi = container "Orders Service Backend" "Swift"{
                    tags "Orders Service" "Backend"
                }
                container "Service 2 Database" {
                    tags "Orders Service" "Database"
                    description "PostgreSQL"
                    ordersServiceApi -> this "Reads from and writes to"
                }
            }

            user -> interface "uses"
            interface -> userServiceApi "Authenticates\nAuthorizes\nFetches settings\nUpdates settings"
            interface -> ordersServiceApi "Checks if ordered items are in stock\nSubmits orders\nFetches order history\nFetches order status\nFetches order details"
            
        }

    }
    
    views {
        container softwareSystem "Containers_All" {
            include *
            autolayout
        }

        container softwareSystem "Containers_Service1" {
            include ->softwareSystem.userService->
            autolayout
        }

        container softwareSystem "Containers_Service2" {
            include ->softwareSystem.ordersService->
            autolayout
        }


        styles {
            element "Person" {
                shape Person
            }
            element "Backend" {
                shape hexagon
            }
            element "Database" {
                shape cylinder
            }
            element "User Service" {
                background #91F0AE
            }
            element "Orders Service" {
                background #EDF08C
            }
            
        }

    }

}