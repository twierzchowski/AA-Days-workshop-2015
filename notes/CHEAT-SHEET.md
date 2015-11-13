# Skrypt do rozmowy z Product Ownerem

## Wskazówki

1. Lista wymagań to świętość - nie dokładamy!
2. Szybko ucinamy dodatkowe pomysły!
3. Błądzić jest rzeczą ludzką, ale nie tutaj.
4. Naprowadzamy na funkcjonalność!
5. Uważamy na off-topic!
6. Nie wspominamy nic o zmianie wymagań, otwieraniu listy i pokazywaniu zamkniętych list!
7. Product Owner nie ma wiedzy technicznej.

## Skrypt

- Zaczynamy rozmowę pytając PO kim jest odbiorca (krótki opis).
- PO mówi krótko co chce.
- Kolejne pytania powinny padać od uczestników.
  - Delikatnie naprowadzamy uczestników na pierwszą funkcjonalność - w aplikacji muszą być listy.
- Pytamy o to co jest na listach - zadania.
- Pytamy o ich stan - jest potrzebny - PO mówi, że tylko zadania mają stan.
- Pytamy o datę czy jest potrzebna - jest potrzebna - nie wiemy czemu, ale ma być.
- PO nagle wspomina o ukrywaniu listy, ale nie mówi kiedy ukrywamy.
  - Kolejne pytania muszą dociec kiedy lista ma być ukryta przed użytkownikami.
- Wprowadzamy pojęcie zamkniętej listy i że to ją należy ukryć.
- PO chce doprecyzować znaczenie pojęć zamknięta lista, otwarta lista - nie wie co to jest, wprowadzić pewne pojęcia domenowe.
- PO wyraźnie zaznacza, że pusta lista musi się pokazywać, ew. może się podroczyć z uczestnikami i kilka razy zmienić zdanie.
- Rozmawiamy o użytkownikach ale tak jakby w ukryciu.
  - Delikatnie naprowadzamy że co gdy dwóch ludzi zechce korzystać z aplikacji razem.
  - Użytkownicy widzą tylko swoje listy, nie ma współdzielnia.
- Potem PO sam przyjmie słowo otwarte / zamknięte także w kontekście zadań.
- Ucinać propozycję mobilnej aplikacji.
- Ucinać propozycję integracji z systemami trzecimi.
- Matylda chce koniecznie aplikację dla niego, nie chce korzystać z gotowych serwisów.

# Słowniczek

- Lista zakupów - grupa produktów do zakupienia, zebrana razem ze względu na wspólny obszar/pochodzenie.
- Produkt - określenie rzeczy do zakupienia.
- Użytkownik - osoba korzystająca z list produktów.
- Stan zakupu - informacja o tym czy produkt został kupiony.
- Produkt zamknięty - produkt kupiony.
- Produkt otwarte - produkt do zakupienia.
- Zamknięta lista zakupów - jest to grupa produktów, która posiada wszystkie elementy kupione.
- Otwarta lista zakupów - jest to grupa produktów, z których przynajmniej jeden jest niezakupiony.

# User Story - Rozwiązania

## ZADANIE 1 - Użytkownik może się zalogować na własne konto

Jako Matylda,
Chcę się zalogować do aplikacji,
Żeby zobaczyć swoje listy zakupów

## ZADANIE 2 - Lista zakupów jest zamknięta kiedy wszystkie jej elementy są oznaczone jako kupione

Jako Matylda,
Chcę zamknąć wszystkie elementy znajdujące się na liście,
Żeby lista została automatycznie zamknięta i nie wprowadzała mnie w błąd

## ZADANIE 3 - Zamknięta lista zakupów jest niedostępna dla użytkownika

Jako Matylda,
Chcę aby moje zamknięte listy zakupów nie były widoczne,
Żeby nie wprowadzały mnie w błąd

## BŁĘDY

- Steps to reproduce -> to nie jest Test Case!
- US nie powinno mieć narzuconego rozwiązania (np. przyciśnięcie przycisku robi kawę).
- Zbyt dużo elementów w jednym US.
  - Jedna funkcjonalność, ewentualnie dołączone "Acceptance Criteria" do niej.
  - Złamanie Single Responsibility Principle (SRP).
- Same "Acceptance Criteria" to nie jest US!

# Komendy

- `RUN_GUI_TESTS.bat`
- `RUN_BDD.bat`
- `START_SERVER.bat`
- `RESTORE.bat`
- `BDD_*.bat` lub `GUI_*.bat`
- `PREPARE_APPLICATION.bat`
- `PREPARE_GUI_TESTS.bat`
- `rake db:migrate`
- `rake db:test:clone`
- `rake bower:install`
- `rails generate rspec:install`
- `rake spec`
- `rails server`
- `bundle install`

# Assignments - Details

## Acceptance Tests

### Task 1

ZADANIE: Kilka błędów językowo-składniowych w pliku 'User_management.feature' oraz w pliku 'users.rb'.

ROZWIĄZANIE:

Kod źródłowy:
```
Given(/^there are no users$/) do
  User.delete_al*l*
end
```

Kod źródłowy:
```
When(/^"([^"]+)" account is created with random password$/) do |username|
  User.create!(:user*name* => username, :pas*s*word => random_pas*s*word())
end
```

Feature:
```
  Scenario: Create new user
    Given there are no user*s*
    When "Mat*i*lda" account is created with random password
    Then "Matylda" account should be available
    And "Matylda" should have non empty pas*s*word
```

### Task 2

ZADANIE: Uzupełnić scenariusz na podstawie istniejących już kroków.

ROZWIĄZANIE:
```
Scenario: Task should has a date
  Given *there is one shopping list named "Non-empty list" with one item named "Item on the list"*
  When *"Non-empty list" will be opened*
  Then *"Item on the list" item should have today's date*
```

### Task 3

ZADANIE: Dopisać jeden cały hook w Cucumberze oraz napisanie całego testu praktycznie od zera.

ROZWIĄZANIE:

Kod źródłowy
```
Then(/^*"([^"]+)" has (\d+) products? inside*$/) do |listName, productsNumber|
  *List.where(:name => listName).first.products.count.should == productsNumber.to_i*

end
```

Scenariusz:
```
Scenario: List can have many products
   Given *there is one shopping list named "My non-empty list" with 3 random products*
   When *"My non-empty list" will be opened*
   Then *"My non-empty list" has 3 products inside*
```

### Task 4 *

ZADANIE: Napisać cały jeden test po stronie pliku feature, bez ani linijki kodu.

ROZWIĄZANIE:
```
  *Scenario: Shopping list with all bought products is visible*
  *Given there is one shopping list named "Closed list" with 1 bought random products*
  *When "Closed list" will be opened*
  *Then "Closed list" should not be available*
  *And "Closed list" should be in repository*
```

### Task 5 *

ZADANIE: Zaimplementować kompletny test w oparciu o jeden nowy krok i resztę starszych, który zweryfikuje możliwość ponownego otwarcia listy z zadaniami (zmiana wymagań).

ROZWIĄZANIE:

Kod źrodłowy:
```
When(/^"([^"]+)" will be reopened$/) do |listName|
  *list = List.where(:name => listName).first*

  *list.reopen!*
  *list.save!*
end
```

Scenariusz:
```
Scenario: List can be reopened with all products at once
  *Given there is one list named "Closed list" with 3 closed random products*
  *When "Closed list" will be reopened*
  *Then all products on "Closed list" should be not signed as bought*
  *And "Closed list" should be available*
  *And "Closed list" should be in repository*
  
```

## Unit Tests

### Task 1

ZADANIE: Naprawić literówki w pliku `product_spec.rb`.

ROZWIĄZANIE:
```
require 'spec_helper*'*

describe Product *do*
  it *{* should belong_to :list }
*end*
```

### Task 2

ZADANIE: Napisać nową asercję weryfikującą poprawne zalogowanie użytkownika w pliku `user_spec.rb`.

ROZWIĄZANIE:
```
it "should be authenticated when password match" do
  *expect(@user.will_authenticate?("password")).to eq(true)*
end
```

### Task 3

ZADANIE: Zapoznanie się z mechanizmem `before`/`after` przy testach jednostkowych. Należy uzupełnić poprawne wartości w asercjach i uzupełnić metodę `before` ustawiającą dane do testu. Repozytorium zwraca tylko listy otwarte.

ROZWIĄZANIE:
```
before(:each) do
  @repository = ListRepository.new

  opened = List.create(:name => "Opened List")
  closed = List.create(:name => "Closed List")
  *closed.close!*

  *@repository.add(opened)*
  *@repository.add(closed)*
end

it "not available lists should not be retrieved from repository" do
  expect(@repository.all.count).to eq(*1*)
  expect(@repository.all.first.name).to eq(*"Opened List"*)
end
```

## GUI Tests

### Task 1

ZADANIE: Kilka literówek do poprawki na rozgrzewkę w trzech plikach.

ROZWIĄZANIE:

Scenariusz:
```
Scenario: Log in to the application
  Given I am on "log**in" page
  When I enter correct login "matylda" with password "te*z*t"
  Then I should see "Lists for matyld**"
```

Kod źródłowy (LoginPage.rb):
```
def mapNameToSelecto*r*(name)
```

Kod źródłowy (pages.rb):
```
when 'log i*n*'
```

### Task 2

ZADANIE: Uzupełnienie scenariusza według gotowych i zaimplementowanych już kroków.

ROZWIĄZANIE:

Scenariusz:
```
Scenario: Closing list
  Given I am logged in as "matylda" with password "test"
  And I am on lists page
  And I add *"Breakfast shopping list" list*
  And *I opened "Breakfast shopping list"*
  And *I add 10 "eggs" product*
  When I buy *"eggs" and mark this on my list*
  And I go to *lists page*
  And *I should see "Lists for matylda"*
  Then I should not see "Breakfast shopping list"
```

### Task 3

ZADANIE: Częściowa implementacja każdego fragmentu po trochu - opis scenariusza, implementacja kroków i poprawki literówek w jednym pliku (selektor XPATH jest z błędami).

ROZWIĄZANIE:

Scenariusz:
```
Scenario: Buy available product from shopping list
  Given I am logged in as "matylda" with password "test"
  And I am on lists page
  And I add "ASAP shopping" list
  And I opened "ASAP shopping"
  And *I add 4 "beers" product*
  And *I add 10 "eggs" product*
  When *I buy "beers" and mark this on my list*
  And I can`t buy eggs as they`ve already sold, so I can just drink beer for the morning breakfast
  And I go to lists page
  Then I should *see* "Lists for matylda"
  And *I should see "ASAP shopping"*
  When *I opened "ASAP shopping"*
  Then I should see *10 "eggs" product to buy*
```

Kod źródłowy (TaskListPage.rb):
```
def selectCheckBoxNearName(name)
  @session.find(
    :xpath,
    "/html/body/section/ul/li/span[contains(text(), '#{name}')]/preceding-sibling::labe**"

  )
end
```

Kod źródłowy (interactions.rb):
```
Given(/^I cleared (.+?)$/) do |name|
  *@page.type("", name)*
end
```