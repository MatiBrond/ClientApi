<%--
  Created by IntelliJ IDEA.
  User: mbrond
  Date: 2019-04-27
  Time: 00:19
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>

    <title>
        Api Clieent Matias Brond
    </title>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="/assets/jquery-3.3.1.min.js"></script>
    <g:javascript library='jquery' plugin='jquery' />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>


</head>

<body>

<form class="needs-validation" name="form" id="form" novalidate>
    <div class="form-row">

        <div class="col-md-4 mb-3 md-form">
            <label for="site">Site</label>

            <g:select optionKey="id" optionValue="name"
                      name="site_id" from="${result}" id="site"
                      onchange="callAjax(this.value);"
                      noSelection="['null':'Seleccione país']"
                      class="custom-select browser-default" required="true">
            </g:select>

        </div>
        <div class="col-md-4 mb-3 md-form">
            <g:select id="met" optionKey="id" optionValue="name"
                      name="payment_method_id" from="${re}"

                      noSelection="['null':'Seleccione método de pago']"
                      class="custom-select browser-default">
            </g:select>
        </div>
        <div class="col-md-4 mb-3 md-form">
            <label for="near_to">Near to</label>
            <input type="text" class="form-control" id="near_to" name="near_to" placeholder="Near to" value=""
                   required>
        </div>
        <div class="col-md-4 mb-3 md-form">
            <label for="near_to">Limite</label>
            <input type="text" class="form-control" id="limit" name="limit" placeholder="Limit" value=""
                   required>
        </div>
        <div class="col-md-4 mb-3 md-form">
            <label for="offset">Offset</label>
            <input type="text" class="form-control" id="offset" name="offset" placeholder="Offset" value=""
                   required>
        </div>
        %{--        <div class="col-md-4 mb-3 md-form">
                    <label for="orden">Orden</label>

                    <g:select id="sort_by" optionKey="id" optionValue="name"
                              name="sort_by" action="" onChange="" from=""
                              noSelection="['null':'Seleccione criterio de orden']">
                    </g:select>

                </div>--}%
    </div>
</form>
<button class="btn btn-primary btn-sm btn-rounded"
        onclick="callAjax2()">Submit
</button>

<g:select id="result" optionKey="id" optionValue="name"
          name="result" from="${re}"
          noSelection="['null':'Results']"
          class="custom-select browser-default">
</g:select>

<div id="result" name="result">

</div>

<script type="text/javascript">

    function callAjax(id){
        var URL= "https://api.mercadolibre.com/sites/" + id + "/payment_methods/"
        $.ajax({
            url:URL,
            method: "GET",
            success: function(response){
                console.log(response)
                $('#met').empty();
                $.each(response, function (i, it) {
                    $('#met').append($('<option>', {
                        value: it.id,
                        text : it.name
                    }));
                });
            }
        });
    }

    function callAjax2(){
        var data = $('#form').serializeArray();
        console.log(data);
        var dataClean = data.filter(Boolean);
        console.log(dataClean);
        console.log("sodicnijsdncisjnjsdncisdncijsnd")
        var URL= "http://localhost:8070/agencies"

        $.ajax({
            url:URL,
            method: "GET",
            data: data,

            success: function(response){


                console.log(response)
                console.log(response.data)

                $.each(response.data, function (a, item) {
                    $('#result').after($('<div>', {
                        value: item.agency_code,
                        text : item.iddress_line
                    }));
                })
            }
        });
    }

</script>

</body>

</html>