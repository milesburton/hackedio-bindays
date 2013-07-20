<script type="text/javascript">
 $(document).ready(function() {
  $('#addresses').change(function() {
   if($('#addresses :selected').text() != "Please select...") {
//    $("#locationId").val($('#addresses').val());
//    $("#displayString").val($('#addresses :selected').text());
    $("#divSearch").hide();

    var strSelectedAddress =  $('#addresses :selected').text();
    var strHtml = "<br/>Selected Address:<br/>";

    strHtml = strHtml + strSelectedAddress;
    strHtml = strHtml + '<br/><br/><div id="divSelectedAddressSummary"></div><div id="changeAddressClient">';
    strHtml = strHtml + '<p style="padding-left: 50px;"><img src="https://www.southwark.gov.uk/site/images/blank.gif" height="1" width="1" alt="blank" />';
    strHtml = strHtml + '<input type="button" name="_finish" id="changeAddress" title="Change address" tabindex="209" value="Change address" class="button" /></p></div>';

    $("#divSelectedAddressClient").html(strHtml);
    $("#divSelectedAddressClient").show();

    $.ajax({
     url: 'findSummary.asp',
     type: 'get',
     data: 'uprn=' + $('#addresses :selected').val(),
     dataType: "html",
     success: function (response) {$("#divSelectedAddressSummary").html(response);}
    });
   }

   $('#changeAddressClient').bind('click', function() {
    $("#divSearch").show();
    $("#divSelectedAddressClient").hide();
   });
  });
 });
</script>


   <b>41 matches found. Please select an address.</b><br/>

  <select id="addresses" tabindex="6" style="width: 450px; margin: 0px;">
   <option value="" selected>Please select...</option>

    <option value="200003386870">1 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386879">2 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386888">3 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386891">4 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386892">5 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386893">6 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386894">7 FERNHOLME ROAD
SE15 3EF</option>

    <option value="10000811173">FIRST FLOOR FLAT
8 FERNHOLME ROAD
SE15 3EF</option>

    <option value="10009800863">GROUND FLOOR FLAT
8 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386896">9 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386871">10 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386872">11 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003389238">12A FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003389239">12B FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386873">13 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386874">14 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386875">15 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003389240">16A FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003389241">16B FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386876">17 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386877">18 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386878">19 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386880">20 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386881">21 FERNHOLME ROAD
SE15 3EF</option>

    <option value="10000811174">22A FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003389242">22B FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386883">23 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386884">24 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003389243">25A FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003389244">25B FERNHOLME ROAD
SE15 3EF</option>

    <option value="10090284056">26 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386885">27 FERNHOLME ROAD
SE15 3EF</option>

    <option value="10090284057">28 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386887">29 FERNHOLME ROAD
SE15 3EF</option>

    <option value="10090284058">30 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003389245">31A FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003389246">31B FERNHOLME ROAD
SE15 3EF</option>

    <option value="10090284059">32 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386889">33 FERNHOLME ROAD
SE15 3EF</option>

    <option value="10090284060">34 FERNHOLME ROAD
SE15 3EF</option>

    <option value="200003386890">35 FERNHOLME ROAD
SE15 3EF</option>

  </select>

