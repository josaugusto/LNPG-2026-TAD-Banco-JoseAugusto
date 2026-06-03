local Cliente = {}
Cliente.__index = Cliente

local function verificarNome(nome)
    if nome and nome ~= "" and #nome >= 5  then
        return nome
    end

    print("Nome invalido!")
    return nil
end

local function verificarCpf(cpf)
    if cpf and #cpf == 11 and cpf:match("^%d+$") then
        return cpf
    end

    print("CPF invalido!")
    return nil
end

local function verificarTelefone(telefone)
    if telefone == nil or telefone == "" then
        return nil
    end

    if telefone:match("^%d+$") and #telefone >= 10 and #telefone <= 11 then
        return telefone
    end

    print("Telefone invalido!")
    return nil
end

local function verificarEmail(email)
    if email == nil or email == "" then
        return nil
    end

    if email:find("@") then
        return email
    end

    print("Email invalido!")
    return nil
end

function Cliente.novo(nome, cpf, telefone, email)
    nome = verificarNome(nome)
    cpf = verificarCpf(cpf)
    telefone = verificarTelefone(telefone)
    email = verificarEmail(email)

    if not nome or not cpf then
        return nil
    end
    
    local cliente = setmetatable({
        nome = nome,
        cpf = cpf,
        telefone = telefone,
        email = email
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
    local telefoneValido = verificarTelefone(telefone)

    self.telefone = telefoneValido
end

function Cliente:alterarEmail(email)
    local emailValido = verificarEmail(email)

    self.email = emailValido
end

local cliente = Cliente.novo("Augusto", "05979334483", "82999111111")

if cliente then
    print(cliente:getNome())
    print(cliente:getCpf())
    print(cliente:getTelefone())
    print(cliente:getEmail())
end

return Cliente