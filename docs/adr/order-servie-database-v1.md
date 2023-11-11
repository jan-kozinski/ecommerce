# Title

choose database for order servie

# Context and drivers

- I want to test PostgreSQL and learn more about it
- Order serice must operate without downtimes
- Order records must be consistent
- Order may have some unstructurized metadata in future (like appliead discount etc.)
- Database must be well supported by swift tools

# Decission

- PostreSQL will be the go to solution

# Caveats

- Mongo have better data visualition and analytics tools
- The orders service will experience reduced performane when big tables will have to be altered
- Orders History will probably be the biggest table in the system

# Other considered choices

- Mongo
