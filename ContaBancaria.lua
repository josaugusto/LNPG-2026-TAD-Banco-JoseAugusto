local ContaBancaria = {}
ContaBancaria.__index = ContaBancaria

local function verificarNumero(numero)
    if numero and numero > 0 then
        return numero
    end

    print("Numero invalido!")
    return nil
end

local function verificarTitular(titular)
    if titular ~= nil then
        return titular
    end

    print("Titular invalido!")
    return nil
end

local function verificarBanco(banco)
    if banco ~= nil then
        return banco
    end

    print("Banco invalido!")
    return nil
end

local function verificarSaldo(saldo)
    if saldo < 0 then
        return 0
    end

    return saldo
end


function ContaBancaria.nova(numero, titular, banco, saldo)
    numero = verificarNumero(numero)
    titular = verificarTitular(titular)
    banco = verificarBanco(banco) 
    saldo = verificarSaldo(saldo)

    if not numero or not titular or not banco then
        return nil
    end

    local conta = setmetatable({
        numero = numero,
        titular = titular,
        banco = banco,
        saldo = saldo
    }, ContaBancaria)

    return conta
end

function ContaBancaria:depositar(valor)
    local saldoValido = verificarSaldo(valor)
    
    self.saldo = self.saldo + saldoValido
end

function ContaBancaria:sacar(valor)
    if self.saldo >= valor then
        self.saldo = self.saldo - valor
    end
end

function ContaBancaria:consultarSaldo()
    return self.saldo
end

function ContaBancaria:getNumero()
    return self.numero
end

function ContaBancaria:getTitular()
    return self.titular
end

function ContaBancaria:getBanco()
    return self.banco
end

function ContaBancaria:estaAtiva()
    if self then
        return true
    end 

    return false
end