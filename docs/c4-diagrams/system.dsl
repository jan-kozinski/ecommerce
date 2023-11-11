workspace {
    model {
        user = person "User" "A user of my software system."
        eCommerce = softwareSystem "eCommerce" "My eCommerce system." {
            webapp = container "Web Application"
            database = container "Database"
        }
        paymentService = softwareSystem "Third party payment service" "" "Third Party System"
        deliveryService = softwareSystem "Third party orders delivery service" "" "Third Party System"

        user -> eCommerce "browse products\nadds to cart\nsubmits orders\nreceivs ordered product"
        eCommerce -> paymentService "requests payments"
        eCommerce -> deliveryService "schedules delivery of product"

    }

    views {
        systemContext eCommerce "SystemContext" {
            include *
            autoLayout
        }

        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Third Party System" {
                background #A7A7A7
                color #000000
            }
            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }
        }
    }  
}
