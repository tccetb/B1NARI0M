<%-- 
    Document   : listar_clientes
    Created on : 21/04/2017, 19:25:02
    Author     : Ant�nio Carlos
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <title>Lista de Clientes</title>
        <script type="text/javascript">
            function excluir(matricula) {
                var url = "gerenciar_cliente.do?op=excluir&matricula=" + matricula;
                if (confirm("Tem certeza que quer excluir o cliente?")) {
                    window.open(url, "_self");
                }
            }
        </script>
    </head>

    <body>
        <!------------------------------------- INPUTS ------------------------------------->
        <div class="mbr-section mbr-section-nopadding">
            <div class="container">
                <div class="container">
                    <h2>Lista de Clientes</h2>           
                    <table class="table">

                        <tr>
                            <th>M�TRICULA</th>
                            <th>NOME</th>
                            <th>CPF</th>
                            <th>SETOR</th>
                            <th>TELEFONE</th>
                            <th colspan="2">OP��ES</th>
                        </tr>


                        <%
                            ArrayList<Cliente> clientes = new ArrayList<Cliente>();
                            Cliente cliente = new Cliente();
                            try {
                                for (Cliente c : cliente.listar()) {
                        %>
                        <tr>
                            <td><%= c.getMatricula()%></td>
                            <td><%= c.getNome()%></td>
                            <td><%= c.getCpf()%></td>
                            <td><%= c.getSetor()%></td>
                            <td><%= c.getTelefone()%></td>
                            <td>
                                <a href="form_altera_cliente.jsp?matricula='<%=c.getMatricula()%>'">Alterar</a>
                                <a href="#" onclick="excluir('<%=c.getMatricula()%>')">Excluir</a>
                            </td>
                        </tr>

                        <%
                                }
                            } catch (Exception e) {
                                out.print("ERRO:" + e);
                            }
                        %>
                    </table>	
                </div>
            </div>
        </div>

    </body>
</html>
