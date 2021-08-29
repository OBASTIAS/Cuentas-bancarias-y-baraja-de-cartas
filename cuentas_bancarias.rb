class Usuario
   def initialize(nombre,cuenta_bancaria)
    raise TypeError, "No posees una cuenta" if cuenta_bancaria.size < 1
    @nombre = nombre
    @cuenta_bancaria = cuenta_bancaria
   end

   def saldo

    total = 0
    @cuenta_bancaria.map {|x| x.saldo}.sum

   end

end

class CuentaBancaria
attr_accessor :saldo
    def initialize (nombre_banco, numero_cuenta, saldo = 0)
        @nombre_banco = nombre_banco
        @numero_cuenta = numero_cuenta
        @saldo = saldo
    end

    def transferir (monto, cuenta_destino)
        raise TypeError, 'No cuenta con el saldo suficiente' if monto > @saldo
        @saldo -= monto 
        cuenta_destino.saldo += monto 
    end



end

cuenta1 = CuentaBancaria.new("Banco Itau", 209132485,10000)
cuenta2 = CuentaBancaria.new("Banco Santander", 69701558, 6000)
cuenta3 = CuentaBancaria.new("Banco Scotiabank", 186376420, 5000)
usuario1 = Usuario.new("Samuel", [cuenta1, cuenta2])
usuario2 = Usuario.new("Felippa", [cuenta3])

puts cuenta2.transferir(6000, cuenta3)
puts usuario1.saldo