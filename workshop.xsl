<xsl:stylesheet version = "1.0" xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"> 

    <xsl:template match = "/">
        <html>
            <head>
                <meta charset="utf-8"></meta>
                <title>Computer Workshop</title>
            </head>
            <body>
                <h2>Clients</h2>
                <table border = "1"  id='clients'>
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
                <p>Всего элементов: <xsl:value-of select="count(workshop/clients/client)"/></p>

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

                <h2>Employes</h2>
                <table border="1" id='employes'>
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
                <p>Всего элементов: <xsl:value-of select="count(workshop/employes/employee)"/></p>

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