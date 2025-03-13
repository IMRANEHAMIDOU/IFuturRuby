Accounts = []
Users = []

class Account
    @@last_account_number = 0
    
    def initialize(user)
        @account_number =  @@last_account_number+=1
        @account_state = true
        @account_blance = 0
        @user = user
        puts "Création réussi. Numéro : #{@account_number}, proprio : #{@user.show()}"
    end

    #depposer de l'argent
    def deposit(amount)
        if(@account_state)
            @account_blance += amount
            puts "Transaction (dépot) réussi !"
            return 1
        else
            puts 'Ce compte est déactivé !'
            return 0
        end
    end

    #retirer de l'argent
    def pull(amount)
        if(@account_state)
            if(@account_blance >= amount)
                @account_blance -= amount
                puts "Transaction (retrait) réussi !"
                return 1
            else
                puts "Solde insuffisant !"
                return 0
            end
        else
            puts 'Ce compte est déactivé !'
            return 0
        end
    end

    #déactivé un compte
    def desable_account()
        @account_state = false
        puts "Compte numéro #{@account_number} déactivé !"
        return 1
    end

    #recuperer le solde
    def get_balance()
        puts "Le solde du compte #{@account_number} est : #{@account_blance}"
        return @account_blance
    end

    #propri
    def get_proprio()
        #puts "le proprietaire du compte #{@account_number} est : #{@user.show()}"
        return @user.show()
    end

    def get_account_number()
        return @account_number
    end
end

class User
    @@last_id = 0
    def initialize(name)
        @name = name
        @id = @@last_id+=1
        Users.push(self)
    end
    def show()
        return @name
    end
    def add_account()
        account = Account.new(self)
        Accounts.push(account)
        return account
    end
end

def get_all_account()
    list_account = ""
    Accounts.each do |account|
        list_account += "- Compte numéro #{account.get_account_number()}, proprio : #{account.get_proprio()}\n"
    end
    puts "--------------------------Tous les comptes ---------------------------"
    puts list_account
end

def search_account_by_number(number)
    account = Accounts.find{|account| account.get_account_number() == number}
    if(account)
        puts "Le compte #{number} existe bien sous le nom de : #{account.get_proprio()}"
        return 1
    else
        puts "Compte numéro #{number} introuvable"
        return 0
    end
end
def search_account_by_user(name)
    puts " ------------------------- Les comptes de : #{name} -------------------------"
    accounts = [] 
    Accounts.each do |account|
        if(account.get_proprio() == name)
            accounts.push(account)
        end
    end
    if(accounts.length>0)
        accounts.each do |account|
            puts "- Compte nuéro #{account.get_account_number()}"
        end
        return 1
    else
        puts "Aucun compte trouvé au nom de #{name}"
        return 0
    end
end

puts "---------------------------BIENVENU A BOA --------------------------------"

user1 = User.new('Imrane')
compte1 = user1.add_account()
compte1.deposit(5000)
compte1.get_balance()
compte1.get_proprio()
compte1.desable_account()
compte1.deposit(54000)
compte1.pull(54000)

compte2 = user1.add_account()
compte2.deposit(50000)
compte2.pull(54000)
compte2.get_balance()
compte2.desable_account()

#liste tous les comptes
get_all_account()
#nombre de compte créer
puts "-----------------Nombre de comptes et nombre d'utilisateurs -------------"
puts "#{Accounts.length} comptes, #{Users.length} utilisateurs."
puts "-----------------Recherche de compte via son numéro ---------------------"
search_account_by_number(3)
search_account_by_user('Imrane')
