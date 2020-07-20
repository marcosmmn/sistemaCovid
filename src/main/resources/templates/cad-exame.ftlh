<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de exames</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
   
</head>
<body>
    <div class="container">
        <nav class="navbar navbar-expand-sm bg-light">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="/cadastro">Formulário</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/listar">Listar exames</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#" onClick="window.print()">Imprimir formulário</a>
              </li>
            </ul>
          </nav>
    <div class="py-3 text-center">
        <img class="d-block mx-auto mb-4" src="/iconeCovid.png" alt="covid" width="72" height="72">
        <h1>FORMULÁRIO PARA LANÇAMENTO DE RESULTADOS DE TESTE RÁPIDO DE
            DETECÇÃO DE CORONAVÍRUS</h1>
        <p><span style="color: brown;">Atenção:</span> nos campos marcados com 'Visível ao público' não devem ser colocados dados de sua intimidade e privacidade.</p>
        <a href="#">Clique aqui em caso de dúvidas relativas a este formulário.</a> 
      </div>

<#if alterar?? >
   
    <form action="/editar" method="POST">
    <input type="hidden" name="id" value="${(exameAtual.id)!}"/>
<#else>
    <form action="/salvar" method="POST">
</#if>    
     <div class="col-md-12 order-md-1">  
      <div class="row">
       <div class="col-md-6 mb-3">
            <label>Nome do paciente: <span style="color: gray;">(Nome completo sem abreviaturas)</span></label>
            <input type="text" class="form-control" id="nomepaciente" name="nomepaciente" value="${(exameAtual.nomepaciente)!}" autocomplete="off" required/>
          
        </div>
        
        <div  class="col-md-6 mb-3">
            <label>Data de nascimento:</label>
            <input type="date" class="form-control" id="datanasc" name="datanasc" value="${(datanascimento)!}" required/>
        </div>
          </div>
        <div class="mb-3">
            <label>Nome da mãe: <span style="color: gray;">(Insira o nome completo da mãe do paciente)</span></label>
            <input type="text" class="form-control" id="nomemae" name="nomemae" value="${(exameAtual.nomemae)!}" autocomplete="off"/>
        </div>
        <div class="mb-3">
            <label>Nome social: <span style="color: gray;">(Insira nome social quando houver)</span></label>
            <input type="text" class="form-control" id="nomesocial" name="nomesocial" value="${(exameAtual.nomesocial)!}" autocomplete="off"/>
        </div>
        <div class="row">
            <div class="col-md-4 mb-3">
                 <label>Data da realização do teste:</label>
                 <input type="date" class="form-control" id="datatest" name="datatest" value="${(datateste)!}" required/>
             </div>
             <div  class="col-md-4 mb-3">
                 <label>Município de residencia do paciente: </label>
                 <input type="text" class="form-control" id="munires" name="munires" value="${(exameAtual.munires)!}" autocomplete="off"/>
             </div>
             <div  class="col-md-4 mb-3">
                 <label>Município de coleta do exame: </label>
                 <input type="text" class="form-control" id="municol" name="municol" value="${(exameAtual.municol)!}" autocomplete="off"/>
             </div>
               </div>
               <div class="mb-3">
                <label>Local/Serviço de saúde de coleta do exame:</label>
                <input type="text" class="form-control" id="localexame" name="localexame" value="${(exameAtual.localexame)!}" autocomplete="off"/>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                     <label>Nome do profissional que realizou o teste rápido:</label>
                     <input type="text" class="form-control" id="nomeprof" name="nomeprof" value="Edgar Mansur Salomão" readonly/>
                 </div>
                 <div  class="col-md-4 mb-3">
                     <label>Numero do registro do conselho de classe:</label>
                     <input type="text" class="form-control" id="numclasse" name="numclasse" value="41144" readonly/>
                 </div>
                 <div  class="col-md-2 mb-3">
                     <label>Conselho de classe: </label>
                     <input type="text" class="form-control" id="classe" name="classe" value="CRBM-1" readonly/>
                 </div>
                   </div>
                   <div class="row">
                    <div class="col-md-4 mb-3">
                         <label>Grupos prioritários</label>
                         <select class="custom-select d-block w-100" id="grupo" name="grupo">
                             <option value="${(exameAtual.grupo)!}"></option>
                             <option value="Profissional de saúde">Profissional de saúde</option>
                             <option value="Profissional de segurança pública">Profissional de segurança pública</option>
                             <option value="Contatos domiciliares de profissionais da saúde e segurança">Contatos domiciliares de profissionais da saúde e segurança</option>
                             <option value="Idosos">Idosos</option>
                             <option value="População economicamente ativa">População economicamente ativa</option>
                         </select>
                     </div>
                     <div  class="col-md-4 mb-3">
                         <label>Paciente esta com sintomas? </label>
                         <div class="form-check">
                            <label class="form-check-label">
                              <input type="radio" class="form-check-input" name="optradiosint" value="Sim - Paciente sintomático" required>Sim - Paciente sintomático
                            </label>
                          </div>
                          <div class="form-check">
                            <label class="form-check-label">
                              <input type="radio" class="form-check-input" name="optradiosint" value="Não - Paciente assintomático" required>Não - Paciente assintomático
                            </label>
                          </div>
                     </div>
                     <div  class="col-md-4 mb-3">
                         <label>Data inicio dos sintomas:</label>
                         <input type="date" class="form-control" id="datatest" name="datasint" value="${(datasintoma)!}">
                     </div>
                       </div>
                       <div class="row">
                        <div  class="col-md-3 mb-3">
                            <label>Resultado do teste rapido:</label>
                            <div class="form-check form-check-inline">
                               <label class="form-check-label">
                                 <input type="radio" class="form-check-input" name="optradiores" value="IgM" required>IgM
                               </label>
                             </div>
                             <div class="form-check form-check-inline">
                               <label class="form-check-label">
                                 <input type="radio" class="form-check-input" name="optradiores" value="IgG" required>IgG
                               </label>
                             </div>
                        
                        </div>
                         <div  class="col-md-9 mb-3">
                             <label>Fabricante do teste e lote: <span>(Digite o nome do fabricante separado por # do numero)</span></label>
                             <input type="text" class="form-control" id="fabri" name="fabri" value="${(exameAtual.fabri)!}" autocomplete="off"/>
                         </div>
                           </div>
                          
                          <#if alterar??>
                            <input type="submit" class="btn btn-warning btn-lg btn-block" value="EDITAR"/>
                          <#else>
                             <input type="submit" class="btn btn-primary btn-lg btn-block" value="GRAVAR"/>
                          </#if>

      </div>

    </form>


    </div>
</div>    

</body>
<footer class="page-footer font-small blue">

    <!-- Copyright -->
    <div class="footer-copyright text-center py-3">© 2020 Copyright:
      <a href="https://www.linkedin.com/in/marcos-molitor/" target="_blank"> Marcos Molitor Neto</a>
    </div>
    <!-- Copyright -->
  
  </footer>
</html>