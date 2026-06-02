local Cliente = {}
Cliente.__index = Cliente

local function verificarNome(nome)
        if nome == nil or nome == "" or #nome < 5 then
            print("Nome invalido!")
        else 
            return nome
        end 
    end

local function verificarCpf(cpf)
    if #cpf == 11 and cpf:match("^%d+$") ~= nil then
        return cpf
    else 
        print("CPF invalido!")
    end 
end

local function verificarTelefone(telefone)
    if telefone:match("^%d+$") ~= nil then
        if #telefone >= 10 and #telefone <= 11 then
                return telefone
        else
            print("Telefone invalido!")
        end
    else
        print("Telefone invalido!")
    end
end

local function verificarEmail(email)
    if email:find("@") then
        return email
    else 
        print("Email invalido!")
    end
end

function Cliente.novo(nome, cpf, telefone, email)
    
    local cliente = setmetatable({
        nome = verificarNome(nome),
        cpf = verificarCpf(cpf),
        telefone = verificarTelefone(telefone),
        email = verificarEmail(email)
    }, Cliente)

    return cliente
end

function Cliente:getNome()
    return self.nome
end

function Cliente:getCpf()
    return self.cpf
end

function Cliente:getTelefone()
    return self.telefone
end

function Cliente:getEmail()
    return self.email
end

function Cliente:alterarTelefone(telefone)
    self.telefone = telefone
end

function Cliente:alterarEmail(email)
    self.email = email
end

local cliente = Cliente.novo("Augusto", "05979334483", "82999111111", "augusto@")

print(cliente:getNome())
print(cliente:getCpf())
print(cliente:getTelefone())
print(cliente:getEmail())

return Cliente