@m0 @_requested @premium_buyer
Feature: Premium buyer

  Scenario: When I sign up as sales manager I can't enable team buyers

  Scenario: I can't enable team buyers when I'm signed up as sales manager

  Scenario: When I sign up as category buyer I can't enable team buyers

  Scenario: I can't enable team buyers when I'm signed up as category buyer

  Scenario: As a sales manager I can request upgrade to sales director from my profile page

  Scenario: When I request account upgrade I should see page describing adventages of sales director

  Scenario: As a category buyer I can request upgrade to category leader from my profile page

  Scenario: When I request account upgrade I should see page describing adventages of category leader

  Scenario: I have team buyers function enabled when I'm sales director

  Scenario: I have team buyers function enabled when I'm category leader

  # jezeli request dzialaja jak komentarze to czy mozna cos napisac w requescie
  Scenario: When I decide to upgrade my account an upgrade request should be created

  # czy w ogole powinien to widziec, czy moze cos dopisywac
  Scenario: As sales manager or category buyer I can see my upgrade requests

  Scenario: As admin I can see comments in the messages tab

  # czy ma to byc widoczne na 1 listingu (wymieszane)
  Scenario: As admin I can see requests in the messages tab

  # czy wspolna dla leadera i directora
  Scenario: As admin I can specify a default fee for upgraded account

  # czy przyadkiem buyer nie pwoienien pozniej tej ceny potwierdzic?
  Scenario: As admin I can specify individual fee for each request and accept request

  # czy jest taka mozliwosc? jesli tak to co?
  Scenario: As admin I can reject a upgrade request

  # co zrobic z subaccountami / jak przeprowadzic downgrade process? czy buyer wysyla wiadomosc czy cos downgrade request?
  # jezeli leady sa assigniete do subaccountow to co z nimi zrobic? / co z powiadomieniami email?
  Scenario: As admin I can downgrade sales director and category leader account

  # czy molizwy okres subskrypcji to tylko i wylacznie 4 tygodnie?
  # czy mozliwe sluzsze subskrypcje / rabaty????
  Scenario: Upgraded account is charged individual fee every 4 weeks

  # system
  Scenario: I periodically check for account to be charged

  # system
  Scenario: Invoices can have different items attached to invoice lines

  # bigbuyer
  Scenario: As admin I can see different items to be invoiced

  # small buyer - zapytac czy tak??
  Scenario: As admin I can see a new invoice gnerated for small buyer for monthly fee

  # czy suktagories automatycznie maja sie zaznaczac ?
  Scenario: As category leader I can request categories from a tree to be available only to me

  Scenario: As admin I can specify total price for requested categories

  Scenario: As admin I can specify time period for each category requested in working days

  Scenario: As admin I can select which categories can be assigned to category leader

  Scenario: As category buyer I can accept the prices and terms specified by admin

  # czy taka kategoria ma byc w ogole widoczna dla innych? czy wylacznosc dotyczy tylko leadow stworzonych w czasie obowiazywania wylacznosci?
  Scenario: When category is requested by category leader then I cannot buy new leads

  Scenario: Category leader is charged individual fee for requested categories

