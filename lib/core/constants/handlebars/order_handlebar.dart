const String ORDER_HANDLEBAR = '''
<!DOCTYPE html> 
<html>  
<head>     
    <title>Confirmare Comandă</title>     
    <style>         
        .container {             
            font-family: Arial, sans-serif;             
            margin: 20px;             
            padding: 20px;             
            border: 1px solid #e0e0e0;             
            border-radius: 8px;             
            max-width: 600px;         
        }          
        
        .header {             
            font-size: 24px;             
            font-weight: bold;             
            margin-bottom: 20px;         
        }          
        
        .order-details {             
            margin-bottom: 20px;         
        }          
        
        .product {             
            border-bottom: 1px solid #e0e0e0;             
            padding: 10px 0;         
        }          
        
        .total {             
            font-size: 18px;             
            font-weight: bold;             
            margin-top: 20px;         
        }     
    </style> 
</head>  
<body>      
    <div class="container">         
        <div class="header">Confirmare Comandă</div>          
        
        <p>Bună {{displayName}},</p>          
        
        <p>Vă mulțumim pentru comanda dumneavoastră! Iată detaliile:</p>          
        
        <div class="order-details">             
            <strong>Adresă de livrare:</strong> {{address}}<br>             
            <strong>Email:</strong> {{email}}<br>             
            <strong>Telefon:</strong> {{phone}}<br>         
        </div>          
        
        <div>             
            <strong>Produse comandate:</strong>             
            {{#products}}             
            <div class="product">                 
                <strong>Denumire produs:</strong> {{productName}}<br>                 
                <strong>Tip produs:</strong> {{productType}}<br>                 
                <strong>Cantitate:</strong> {{quantity}}<br>                 
                <strong>Preț produs:</strong> {{productPrice}} RON             
            </div>             
            {{/products}}         
        </div>          
        
        <div class="total">             
            <strong>Preț total:</strong> {{totalPrice}} RON         
        </div>          
        
        <p>În cazul în care aveți întrebări, nu ezitați să ne contactați la matthiolashop@gmail.com.</p>          
        
        <p>Vă mulțumim că ați ales să cumpărați de la noi!</p>          
        
        <p>Cu respect,<br>Matthiola flower shop</p>     
    </div>   
</body>  
</html>
''';
