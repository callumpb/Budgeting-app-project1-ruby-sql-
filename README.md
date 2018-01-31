## MoneyCashboard

You want to start tracking your spending in an attempt to be more frugal with money. You have decided to make a budgeting app to help you see where all of your money is being spent.

You must be able to create new Transactions ( which should include a merchant name, e.g. Tesco, and a value ) which have an associated Tag (e.g. 'food', 'clothes'). Your app would then be able to track a total, and display this in a view.

### MVP:

- Create new transactions
- Display a list of all transactions
- Display total amount spent
- Display total amount spent by tag

### Possible Extensions:

- CRUD actions for the transactions
- Show a warning when the total expenditure is over budget (set a hard coded budget first)
- Add a date to the transactions and view total spending by month
- Any other ideas you might come up with

### Setting up

‘brew install ruby’
‘gem install sinatra sinatra-contrib’

install Postgres on your machine.


## Moving Forward

Moving forward I would like to work on the extensions, particularly the warning for total expenditure as well as improving overall design.


## Problems encountered:

-usual spelling mistakes/silly errors

-setting up files/directories in correct order and understanding how they all link to each other through controllers

-initially forgot an obvious step to link db with tables!:
psql -d cashboard -f cashboard.sql

-app.rb/controller confusion. Mixing up their use and trying to run controllers.

-attempting to rely less on referring back to previous homework

-The use of yield in layout file
