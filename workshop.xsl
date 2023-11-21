<xsl:stylesheet version = "1.0" xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"> 
    <xsl:template match = "/">
        <html>
            <head>
                <meta charset="utf-8"></meta>
                <title>Computer Workshop</title>
                <script src="./node_modules/jquery/dist/jquery.min.js"></script>
                <script src="./node_modules/jquery.maskedinput/src/jquery.maskedinput.js"></script>
                <script src="./node_modules/tablesorter/dist/js/jquery.tablesorter.min.js"></script>
                <script src="./script.js"></script>
            </head>
            <style>
                .addforms {
                    margin: 20px 0;
                }
                label {
                    width: 160;
                    display: inline-block;
                }
                input, select {
                    width: 220px;
                    margin: 2px 0;
                }
                h3, input[type="submit"] {
                    width: 380px;
                    text-align: center;
                }
                .bad-input {
                    border-color: red;
                    border-width: 2px;
                }
                .tablesorter-header-inner {
                    display: inline;
                }
                .tablesorter-headerUnSorted::after,
                .tablesorter-headerAsc::after,
                .tablesorter-headerDesc::after {
                    display: 'inline-block';
                    margin-left: 10px;
                }
                .tablesorter-headerUnSorted::after {
                    content: "►";
                }
                .tablesorter-headerAsc::after {
                    content: "▲";
                }
                .tablesorter-headerDesc::after {
                    content: "▼";
                }

                .odd { 
                    background-color: pink;
                }
            </style>
            <body>
                <h3>Управление формой</h3>
                <label for="sel">Table: </label>
                <select name="sel" id="sel" onchange="show(this);">
                    <option value="1">client</option>
                    <option value="2">employee</option>
                </select>
                
                <form name="form1" class="addforms client" method="post" action="vendor/client.php" id="form1" style="display:block" >
                    <!-- Форма для создания клиента -->
                    <h3>Создание клиента</h3>
                    <label for="fullname">Fullname: </label>
                    <input type="text" name="fullname" id="fullname"/><br/>
                    <label for="email">Email: </label>
                    <input type="text" name="email" id="email" /><br/>
                    <label for="telephone">Telephone: </label>
                    <input type="text" name="telephone" id="telephone" class="tel" /><br/>
                    <label for="birth">Birth: </label>
                    <input type="date" name="birth" id="birth" /><br/>
                    <input type="submit" name="submit1" disabled="true" value="Добавить запись"/>
                </form>

                <form name="form2" class="addforms employee" method="post" action="vendor/employee.php" id="form2" style="display:none">
                    <!-- Форма для создания сотрудника -->
                    <h3>Создание сотрудника</h3>
                    <label for="fullname">Fullname: </label>
                    <input type="text" name="fullname" id="fullname"/><br/>
                    <label for="post_id">Post: </label>
                    <select name="post_id" id="post_id">
                        <xsl:for-each select = "workshop/posts/post">
                            <option>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="position()"/>
                                </xsl:attribute>
                                <xsl:value-of select="name"/>
                            </option>
                        </xsl:for-each>
                    </select>
                    <br/>
                    <label for="date_of_employment">Date Of Employment: </label>
                    <input type="date" name="date_of_employment" id="date_of_employment"/><br/>
                    <label for="birth">Birth: </label>
                    <input type="date" name="birth" id="birth" /><br/>
                    <input type="submit" name="submit1" disabled="true" value="Добавить запись"/>
                </form>
                
                <h2>Clients</h2>

                <form name="cl_del" class="clients" method="post" action="vendor/client_delete.php" id="cl_del">
                    <label for="row_index">Удаление строки: </label>
                    <input type="number" name="row_index" id="row_index"/><br/>
                    <input type="submit" name="submit1" disabled="true" value="Удалить запись"/>
                </form>

                <table border = "1"  id='clients' class="tablesorter">
                    <thead>
                        <tr bgcolor="purple">
                            <th>№</th>
                            <th>Fullname</th>
                            <th>Email</th>
                            <th>Telephone</th>
                            <th>Birth</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select = "workshop/clients/client">
                            <tr>
                                <xsl:if test="position() mod 2=1">
                                    <xsl:attribute name="style">
                                        background-color: pink;
                                    </xsl:attribute>
                                </xsl:if> 
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="fullname"/></td>
                                <td><xsl:value-of select="email"/></td>
                                <td><xsl:value-of select="telephone"/></td>
                                <td><xsl:value-of select="birth"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>

                <form name="cl_put" class="client" method="post" action="vendor/client_put.php" id="cl_put">
                    <label for="row_index">Номер строки: </label>
                    <input type="number" name="row_index" id="row_index"/><br/>
                    <label for="fullname">Fullname: </label>
                    <input type="text" name="fullname" id="fullname"/><br/>
                    <label for="email">Email: </label>
                    <input type="text" name="email" id="email" /><br/>
                    <label for="telephone">Telephone: </label>
                    <input type="text" name="telephone" id="telephone" class="tel" /><br/>
                    <label for="birth">Birth: </label>
                    <input type="date" name="birth" id="birth" /><br/>
                    <input type="submit" name="submit1" disabled="true" value="Перезаписать"/>
                </form>

                <p>Всего элементов: <xsl:value-of select="count(workshop/clients/client)"/></p>

                <h2>Employes</h2>

                <form name="emp_del" class="employee" method="post" action="vendor/employee_delete.php" id="emp_del">
                    <label for="row_index">Удаление строки: </label>
                    <input type="number" name="row_index" id="row_index"/><br/>
                    <input type="submit" name="submit1" disabled="true" value="Удалить запись"/>
                </form>

                <table border="1" id='employes' class="tablesorter">
                    <thead>
                        <tr bgcolor="purple">
                            <th>№</th>
                            <th>Post ID</th>
                            <th>Fullname</th>
                            <th>Date Of Employment</th>
                            <th>Birth</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="workshop/employes/employee">
                            <tr>
                                <xsl:if test="position() mod 2=1">
                                    <xsl:attribute name="style">
                                        background-color: pink;
                                    </xsl:attribute>
                                </xsl:if> 
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="post_id"/></td>
                                <td><xsl:value-of select="fullname"/></td>
                                <td><xsl:value-of select="date_of_employment"/></td>
                                <td><xsl:value-of select="birth"/></td>
                                
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>

                <form name="emp_put" class="employee" method="post" action="vendor/employee_put.php" id="emp_put">
                    <label for="row_index">Номер строки: </label>
                    <input type="number" name="row_index" id="row_index"/><br/>
                    <label for="fullname">Fullname: </label>
                    <input type="text" name="fullname" id="fullname"/><br/>
                    <label for="post_id">Post: </label>
                    <select name="post_id" id="post_id">
                        <xsl:for-each select = "workshop/posts/post">
                            <option>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="position()"/>
                                </xsl:attribute>
                                <xsl:value-of select="name"/>
                            </option>
                        </xsl:for-each>
                    </select>
                    <br/>
                    <label for="date_of_employment">Date Of Employment: </label>
                    <input type="date" name="date_of_employment" id="date_of_employment"/><br/>
                    <label for="birth">Birth: </label>
                    <input type="date" name="birth" id="birth" /><br/>
                    <input type="submit" name="submit1" disabled="true" value="Перезаписать"/>
                </form>

                <p>Всего элементов: <xsl:value-of select="count(workshop/employes/employee)"/></p>

                <h2>Clients Archive</h2>

                <form name="cl_restore" class="client" method="post" action="vendor/client_restore.php" id="cl_restore">
                    <label for="row_index">Восстановление строки: </label>
                    <input type="number" name="row_index" id="row_index"/><br/>
                    <input type="submit" name="submit1" disabled="true" value="Восстановить"/>
                </form>

                <table border = "1"  id='arch_clients'>
                    <thead>
                        <tr bgcolor="purple">
                            <th>№</th>
                            <th>Fullname</th>
                            <th>Email</th>
                            <th>Telephone</th>
                            <th>Birth</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select = "workshop/arch_clients/client">
                            <tr>
                                <xsl:if test="position() mod 2=1">
                                    <xsl:attribute name="style">
                                        background-color: pink;
                                    </xsl:attribute>
                                </xsl:if> 
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="fullname"/></td>
                                <td><xsl:value-of select="email"/></td>
                                <td><xsl:value-of select="telephone"/></td>
                                <td><xsl:value-of select="birth"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>

                <p>Всего элементов: <xsl:value-of select="count(workshop/arch_clients/client)"/></p>

                <h2>Employes Archive</h2>

                <form name="emp_restore" class="employee" method="post" action="vendor/employee_restore.php" id="emp_restore">
                    <label for="row_index">Восстановление строки: </label>
                    <input type="number" name="row_index" id="row_index"/><br/>
                    <input type="submit" name="submit1" disabled="true" value="Восстановить"/>
                </form>
                <table border="1" id='arch_employes'>
                    <thead>
                        <tr bgcolor="purple">
                            <th>№</th>
                            <th>Post ID</th>
                            <th>Fullname</th>
                            <th>Date Of Employment</th>
                            <th>Birth</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="workshop/arch_employes/employee">
                            <tr>
                                <xsl:if test="position() mod 2=1">
                                    <xsl:attribute name="style">
                                        background-color: pink;
                                    </xsl:attribute>
                                </xsl:if> 
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="post_id"/></td>
                                <td><xsl:value-of select="fullname"/></td>
                                <td><xsl:value-of select="date_of_employment"/></td>
                                <td><xsl:value-of select="birth"/></td>
                                
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>

                <p>Всего элементов: <xsl:value-of select="count(workshop/arch_employes/employee)"/></p>

                <h2>Orders</h2>
                <table border = "1"  id='orders'>
                    <thead>
                        <tr bgcolor="purple">
                            <th>№</th>
                            <th>Client ID</th>
                            <th>Status ID</th>
                            <th>Employee ID</th>
                            <th>Transaction ID</th>
                            <th>Date Order</th>
                            <th>Date Complete</th>
                            <th>Comment</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="workshop/orders/order">
                            <tr>
                                <xsl:if test="position() mod 2=1">
                                    <xsl:attribute name="style">
                                        background-color: pink;
                                    </xsl:attribute>
                                </xsl:if> 
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="client_id"/></td>
                                <td><xsl:value-of select="status_id"/></td>
                                <td><xsl:value-of select="employee_id"/></td>
                                <td><xsl:value-of select="transaction_id"/></td>
                                <td><xsl:value-of select="date_order"/></td>
                                <td><xsl:value-of select="date_complete"/></td>
                                <td><xsl:value-of select="comment"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <p>Всего элементов: <xsl:value-of select="count(workshop/orders/order)"/></p>

                <h2>Posts</h2>
                <table border="1" id='posts'>
                    <thead>
                        <tr bgcolor="purple">
                            <th>№</th>
                            <th>Name</th>
                            <th>Department ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="workshop/posts/post">
                            <tr>
                                <xsl:if test="position() mod 2=1">
                                    <xsl:attribute name="style">
                                        background-color: pink;
                                    </xsl:attribute>
                                </xsl:if> 
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="name"/></td>
                                <td><xsl:value-of select="department_id"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <p>Всего элементов: <xsl:value-of select="count(workshop/posts/post)"/></p>
            
                <h2>Departments</h2>
                <table border="1" id='departments'>
                    <thead>
                        <tr bgcolor="purple">
                            <th>№</th>
                            <th>Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="workshop/departments/department">
                            <tr>
                                <xsl:if test="position() mod 2=1">
                                    <xsl:attribute name="style">
                                        background-color: pink;
                                    </xsl:attribute>
                                </xsl:if> 
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="name"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <p>Всего элементов: <xsl:value-of select="count(workshop/departments/department)"/></p>

                <h2>Statuses</h2>
                <table border="1" id='statuses'>
                    <thead>
                        <tr bgcolor="purple">
                            <th>№</th>
                            <th>Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="workshop/statuses/status">
                            <tr>
                                <xsl:if test="position() mod 2=1">
                                    <xsl:attribute name="style">
                                        background-color: pink;
                                    </xsl:attribute>
                                </xsl:if> 
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="name"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <p>Всего элементов: <xsl:value-of select="count(workshop/statuses/status)"/></p>

                <h2>Manufacturers</h2>
                <table border="1" id='manufacturers'>
                    <thead>
                        <tr bgcolor="purple">
                            <th>№</th>
                            <th>Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="workshop/manufacturers/manufacturer">
                            <tr>
                                <xsl:if test="position() mod 2=1">
                                    <xsl:attribute name="style">
                                        background-color: pink;
                                    </xsl:attribute>
                                </xsl:if> 
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="name"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <p>Всего элементов: <xsl:value-of select="count(workshop/manufacturers/manufacturer)"/></p>

                <h2>Operation Types</h2>
                <table border="1" id='operation_types'>
                    <thead>
                        <tr bgcolor="purple">
                            <th>№</th>
                            <th>Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="workshop/operation_types/operation_type">
                            <tr>
                                <xsl:if test="position() mod 2=1">
                                    <xsl:attribute name="style">
                                        background-color: pink;
                                    </xsl:attribute>
                                </xsl:if> 
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="name"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <p>Всего элементов: <xsl:value-of select="count(workshop/operation_types/operation_type)"/></p>

                <h2>Appeals</h2>
                <table border="1" id='appeals'>
                    <thead>
                        <tr bgcolor="purple">
                            <th>№</th>
                            <th>Client ID</th>
                            <th>Theme</th>
                            <th>Content</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="workshop/appeals/appeal">
                            <tr>
                                <xsl:if test="position() mod 2=1">
                                    <xsl:attribute name="style">
                                        background-color: pink;
                                    </xsl:attribute>
                                </xsl:if> 
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="client_id"/></td>
                                <td><xsl:value-of select="theme"/></td>
                                <td><xsl:value-of select="content"/></td>
                                <td><xsl:value-of select="date"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <p>Всего элементов: <xsl:value-of select="count(workshop/appeals/appeal)"/></p>

                <h2>Transactions</h2>
                <table border="1" id='transactions'>
                    <thead>
                        <tr bgcolor="purple">
                            <th>№</th>
                            <th>Type ID</th>
                            <th>Status ID</th>
                            <th>Date</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="workshop/transactions/transaction">
                            <tr>
                                <xsl:if test="position() mod 2=1">
                                    <xsl:attribute name="style">
                                        background-color: pink;
                                    </xsl:attribute>
                                </xsl:if> 
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="type_id"/></td>
                                <td><xsl:value-of select="status_id"/></td>
                                <td><xsl:value-of select="date"/></td>
                                <td><xsl:value-of select="amount"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <p>Всего элементов: <xsl:value-of select="count(workshop/transactions/transaction)"/></p>
                
                <h2>Promotions</h2>
                <table border="1" id='promotions'>
                    <thead>
                        <tr bgcolor="purple">
                            <th>№</th>
                            <th>Transaction ID</th>
                            <th>Service Name</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="workshop/promotions/promotion">
                            <tr>
                                <xsl:if test="position() mod 2=1">
                                    <xsl:attribute name="style">
                                        background-color: pink;
                                    </xsl:attribute>
                                </xsl:if> 
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="transaction_id"/></td>
                                <td><xsl:value-of select="service_name"/></td>
                                <td><xsl:value-of select="date"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <p>Всего элементов: <xsl:value-of select="count(workshop/promotions/promotion)"/></p>

                <h2>Parts</h2>
                <table border="1" id='parts'>
                    <thead>
                        <tr bgcolor="purple">
                            <th>№</th>
                            <th>Nomenclature</th>
                            <th>Manufacturer ID</th>
                            <th>Count</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="workshop/parts/part">
                            <tr>
                                <xsl:if test="position() mod 2=1">
                                    <xsl:attribute name="style">
                                        background-color: pink;
                                    </xsl:attribute>
                                </xsl:if> 
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="nomenclature"/></td>
                                <td><xsl:value-of select="manufacturer_id"/></td>
                                <td><xsl:value-of select="count"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <p>Всего элементов: <xsl:value-of select="count(workshop/parts/part)"/></p>

                <h2>Movements of Parts</h2>
                <table border="1" id='movements_parts'>
                    <thead>
                        <tr bgcolor="purple">
                            <th>№</th>
                            <th>Part ID</th>
                            <th>Type ID</th>
                            <th>Count</th>
                            <th>Comment</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="workshop/movements_parts/movement_parts">
                            <tr>
                                <xsl:if test="position() mod 2=1">
                                    <xsl:attribute name="style">
                                        background-color: pink;
                                    </xsl:attribute>
                                </xsl:if> 
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="part_id"/></td>
                                <td><xsl:value-of select="type_id"/></td>
                                <td><xsl:value-of select="count"/></td>
                                <td><xsl:value-of select="comment"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <p>Всего элементов: <xsl:value-of select="count(workshop/movements_parts/movement_parts)"/></p>

                <h2>Deliveries</h2>
                <table border="1" id='deliveries'>
                    <thead>
                        <tr bgcolor="purple">
                            <th>№</th>
                            <th>Status ID</th>
                            <th>Movement Parts ID</th>
                            <th>Transaction ID</th>
                            <th>Date Create</th>
                            <th>Date Done</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="workshop/deliveries/delivery">
                            <tr>
                                <xsl:if test="position() mod 2=1">
                                    <xsl:attribute name="style">
                                        background-color: pink;
                                    </xsl:attribute>
                                </xsl:if> 
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="status_id"/></td>
                                <td><xsl:value-of select="movement_parts_id"/></td>
                                <td><xsl:value-of select="transaction_id"/></td>
                                <td><xsl:value-of select="date_create"/></td>
                                <td><xsl:value-of select="date_done"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <p>Всего элементов: <xsl:value-of select="count(workshop/deliveries/delivery)"/></p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>