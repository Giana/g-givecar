# G-GiveCar

G-GiveCar is a script for FiveM QBCore providing a command to give a new car to an online citizen by putting it in their garage.

<h1>INSTALLATION GUIDE</h1>

1. Drop the g-givecar folder into your [standalone] folder (or whichever other ensured folder you want to use)
2. Execute the query from g-givecar.sql in your server's database
3. Use "add_ace" in your server.cfg to give desired access to the command
    1. Ex: add_ace group.admin "can.givecar" allow
    2. Ex. add_ace identifier.steam:xxxxxxxxxxxxxxx "can.givecar" allow
    3. For more info: https://forum.cfx.re/t/basic-aces-principals-overview-guide/90917


<h1>FEATURES</h1>

- /admingivecar [id] [carname] used to give player (by server ID) specified car
    - Ex. /admingivecar 1 adder
- Know which admin gave a car away via the "giver_admin" field in the player_vehicles table
- Configure which garage the car goes to
- Configure notifications on car send & receipt via text messages or pop-up notifications

**IMAGES**
-----
![/admingivecar Command](https://i.ibb.co/CwVGVjt/admingivecarcommand.png)

**DEPENDENCIES**
-----
- [QBCore](https://github.com/qbcore-framework)
    - [qb-core](https://github.com/qbcore-framework/qb-core)
    - [qb-phone](https://github.com/qbcore-framework/qb-phone)
- [oxmysql](https://github.com/overextended/oxmysql)

**CREDIT**
-----
The code for generating a new license plate is from [qb-vehicleshop](https://github.com/qbcore-framework/qb-vehicleshop).