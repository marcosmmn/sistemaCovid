<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de exames</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
    button.btn{
      cursor:pointer;
      
    }

    tr.shown button.btn:before {

    background-color:red;
        
    
} 
    </style>
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
        <h1>Lista de exames</h1>
     </div>

</div> 
    <div class="container-fluid">
    
     <table class="table table-striped table-bordered dt-responsive nowrap" id="servicetable">
    <thead>
        <th>-</th>
        <th>ID</th>
        <th>PROTOCOLO</th>
        <th>DATA NASCIMENTO</th>
        <th>AÇÕES</th>        
        
        
    </thead>
    <tbody>
    <#list listaExames as exame>
          <tr data-child-name="${exame.id}" data-child-value="${exame.nomepaciente}" data-child-troco="${exame.nomemae}">
         <td style="align: center;"> 
         <button type="button" class="btn btn-info" >
          <i class="glyphicon glyphicon-plus"></i> Informações 
        </button>
         
            </td>
    <td>${exame.id}<br></td>
    <td>${exame.nomepaciente}</td>
    <td>${exame.datanasc?string.short}</td>
    <td>
    <a href="/prepareEditar?id=${exame.id}" class="btn btn-outline-warning" >Editar <i class="glyphicon glyphicon-edit"></i></a>
            <a href="/excluir?id=${exame.id}" class="btn btn-outline-danger" >Excluir <i class="glyphicon glyphicon-remove"></i></a>
    </td>
      </tr>
        </#list>
         </tbody>
        </table>
    </div>
 

    

    
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>  
    <script src="https://cdn.datatables.net/plug-ins/1.10.21/i18n/Portuguese-Brasil.json"></script>

  <script type="text/javascript" src="jquery.dataTables.js"></script>
  <script type="text/javascript">
  function format (name,value,troco) {
    return '<div>ID: ' + name + '<br />Nome do paciente: ' + value + '<br />Nome da mãe: ' + troco + '</div>';
}
  var table = $('#servicetable').DataTable({
      language: {
          url: '//cdn.datatables.net/plug-ins/725b2a2115b/i18n/Portuguese-Brasil.json',
          // searchPlaceholder: "Søk i service..."
      },
      
  });
  // $('.dataTables_filter input').attr("placeholder", "skriv inn søketekst...");
  // Add event listener for opening and closing details
  $('#servicetable tbody').on('click', 'button.btn', function () {
      var tr = $(this).closest('tr');
      var row = table.row(tr);

      if (row.child.isShown()) {
          // This row is already open - close it
          row.child.hide();
          tr.removeClass('shown');
      } else {
          // Open this row
          row.child(format(tr.data('child-name'), tr.data('child-value'),tr.data('child-troco'))).show();
          tr.addClass('shown');
      }
  });

</script>

</body>
<footer class="page-footer font-small blue">

    <!-- Copyright -->
    <div class="footer-copyright text-center py-3">© 2020 Copyright:
      <a href="https://www.linkedin.com/in/marcos-molitor/" target="_blank"> Marcos Molitor Neto</a>
    </div>
    <!-- Copyright -->
  
  </footer>
</html>