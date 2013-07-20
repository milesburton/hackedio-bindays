<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml" lang="en">
 <head>
  <title>Southwark Council - Street Services  - Main Search</title>
  <link rel="stylesheet" type="text/css" href="https://www.southwark.gov.uk/site/styles/standard.css" media="screen" />

  <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
  <!--[if lte IE 6]>
   <link rel="stylesheet" type="text/css" href="https://www.southwark.gov.uk/site/styles/generic/ie-six.css" media="screen" />
  <![endif]-->
  <!--[if IE 7]>
   <link rel="stylesheet" type="text/css" href="https://www.southwark.gov.uk/site/styles/generic/ie-seven.css" media="screen" />
  <![endif]-->
  <!--[if IE 8]>
   <link rel="stylesheet" type="text/css" href="https://www.southwark.gov.uk/site/styles/generic/ie-eight.css" media="screen" />
  <![endif]-->

  <link rel="Shortcut Icon" type="image/x-icon" href="https://www.southwark.gov.uk/site/favicon.ico" />
  <link rel="stylesheet" type="text/css" href="assets/css/custom.css" media="screen" />
  <script type="text/javascript" src="assets/js/jquery/jquery-1.2.6.min.js"></script>
  <script type="text/javascript" src="assets/js/jquery/jquery.form.js"></script>
 </head>


  <body>
   <div id="wrapper">
    <div id="ie_wrapper">
     <img src="http://www.southwark.gov.uk/site/custom_scripts/SessionTracking/keepSessionAlive.php" alt="php image" style="display: none;" />
     <p class="topNav">
      <span><a href="#content" rel="nofollow">Jump to content</a>| <a class="accessibilityLink" href="http://www.southwark.gov.uk/accessibility/settings">Change font size and colours</a></span>
      You are not signed in.  <a href="http://www.southwark.gov.uk/custom/sign_in">Sign in</a> or <a href="http://www.southwark.gov.uk/custom/register">register</a>?
     </p>

     <div id="mast">
      <form action="http://www.southwark.gov.uk/site/scripts/google_results.php" method="get" name="search" id="search">
       <label for="SearchSite">Search this site</label>
       <input type="text" size="18" maxlength="40" class="field" name="q" id="SearchSite" value="" /><input type="submit" value="Search" class="button" />
      </form>
      <div class="pseudoH1"><a href="http://www.southwark.gov.uk"><span>Southwark Council</span> <img src="https://www.southwark.gov.uk/site/images/blank.gif" alt="Southwark Council logo" /></a></div>

      <div id="taskNavigation">
       <ul>
        <li><a href="http://www.southwark.gov.uk/"  class="selected"><span>Home</span></a></li>
        <li><a href="http://www.southwark.gov.uk/info/10058/about_southwark_council" ><span>Your council</span></a></li>
        <li><a href="http://www.southwark.gov.uk/whatson" ><span>What&#039;s on</span></a></li>
        <li><a href="http://www.southwark.gov.uk/news" ><span>News</span></a></li>
        <li><a href="http://www.southwark.gov.uk/site/scripts/documents.php?categoryID=100008" ><span>Jobs</span></a></li>
        <li><a href="http://maps.southwark.gov.uk/connect/in_my_area.jsp" ><span>In my area</span></a></li>
        <li><a href="http://www.southwark.gov.uk/a_to_z" ><span>A-Z</span></a></li>
        <li><a href="http://www.southwark.gov.uk/info/200212/egovernment/1370/southwark_maps" ><span>Maps</span></a></li>
        <li><a href="http://www.southwark.gov.uk/doitonline" ><span>Do it online</span></a></li>
        <li><a href="http://www.southwark.gov.uk/mysouthwark" ><span>My Southwark</span></a></li>
       </ul>
      </div>

      <div class="clear"></div>
     </div>
     <div id="page_wrap">
      <div id="page">
       <div id="content" class="withWidth">
        <div id="breadcrumb">
         <ul>
          <li><a href="http://www.southwark.gov.uk/">Home</a></li>
          <li><a href="http://www.southwark.gov.uk/info/100006/environment" >Environment</a></li>
          <li><a href="http://www.southwark.gov.uk/info/200084/recycling_and_waste" >Recycling and waste</a></li>
          <li><a href="http://www.southwark.gov.uk/info/200084/recycling_and_waste/1362/collection_days/2" >Collection days</a></li>
          <li class="bc_end"><span>Refuse and recycling schedules</span></li>
         </ul>
        </div>
        <div id="formcontainer">
         <h1>Refuse and Recycling Schedules</h1>
         <!-- ########################## FORM CODE HERE -->
          <form class="basic_form" action='/index.asp' method="post">
           <fieldset>
            To find out when services are occurring in your street, enter your full postcode, then select your property from the list.

            <div id="addressSearchContainer" class="addresssearchbox">
             <script type="text/javascript">
              $(document).ready(function() {
               $('#addressSearch').click(function() {
                if($("#postcode").val() == "") {
                 $("#divSearchResults").html('<b>Please enter postcode.</b>');
                }else{
                 if (checkPostCode ($("#postcode").val())) {
                  var postCode = $("#postcode").val();

                  postCode = postCode.replace (" ","");
                  $("#postcode").val(checkPostCode ($("#postcode").val()));
                 }

                 $("#divSearchResults").html('<br/><img src="assets/images/ajax-loader.gif" height="16" width="16" /> Your request is being processed. Please wait...');

                 $.ajax({
                  url: 'findAddress.asp',
                  type: 'get',
                  data: 'pc=' + postCode,
                  dataType: "html",
                  success: function (response) {
                   $("#divSearchResults").html(response);
                  }
                 });
                }
               });
              });

              function checkPostCode (toCheck) {

               // Permitted letters depend upon their position in the postcode.
               var alpha1 = "[abcdefghijklmnoprstuwyz]";                       // Character 1
               var alpha2 = "[abcdefghklmnopqrstuvwxy]";                       // Character 2
               var alpha3 = "[abcdefghjkpmnrstuvwxy]";                         // Character 3
               var alpha4 = "[abehmnprvwxy]";                                  // Character 4
               var alpha5 = "[abdefghjlnpqrstuwxyz]";                          // Character 5

               // Array holds the regular expressions for the valid postcodes
               var pcexp = new Array ();

               // Expression for postcodes: AN NAA, ANN NAA, AAN NAA, and AANN NAA
               pcexp.push (new RegExp ("^(" + alpha1 + "{1}" + alpha2 + "?[0-9]{1,2})(\\s*)([0-9]{1}" + alpha5 + "{2})$","i"));

               // Expression for postcodes: ANA NAA
               pcexp.push (new RegExp ("^(" + alpha1 + "{1}[0-9]{1}" + alpha3 + "{1})(\\s*)([0-9]{1}" + alpha5 + "{2})$","i"));

               // Expression for postcodes: AANA  NAA
               pcexp.push (new RegExp ("^(" + alpha1 + "{1}" + alpha2 + "{1}" + "?[0-9]{1}" + alpha4 +"{1})(\\s*)([0-9]{1}" + alpha5 + "{2})$","i"));

               // Exception for the special postcode GIR 0AA
               pcexp.push (/^(GIR)(\s*)(0AA)$/i);

               // Standard BFPO numbers
               pcexp.push (/^(bfpo)(\s*)([0-9]{1,4})$/i);

               // c/o BFPO numbers
               pcexp.push (/^(bfpo)(\s*)(c\/o\s*[0-9]{1,3})$/i);

               // Overseas Territories
               pcexp.push (/^([A-Z]{4})(\s*)(1ZZ)$/i);

               // Load up the string to check
               var postCode = toCheck;

               // Assume we're not going to find a valid postcode
               var valid = false;

               // Check the string against the types of post codes
               for ( var i=0; i<pcexp.length; i++) {
                if (pcexp[i].test(postCode)) {

                 // The post code is valid - split the post code into component parts
                 pcexp[i].exec(postCode);

                 // Copy it back into the original string, converting it to uppercase and
                 // inserting a space between the inward and outward codes
                 postCode = RegExp.$1.toUpperCase() + " " + RegExp.$3.toUpperCase();

                 // If it is a BFPO c/o type postcode, tidy up the "c/o" part
                 postCode = postCode.replace (/C\/O\s*/,"c/o ");

                 // Load new postcode back into the form element
                 valid = true;

                 // Remember that we have found that the code is valid and break from loop
                 break;
                }
               }

               // Return with either the reformatted valid postcode or the original invalid
               // postcode
               if (valid) {return postCode;} else return false;
              }
             </script>

<!--             <div id="divAddressSearch" class="addresssearchSubDiv">  -->
             <div>
              <div id="divSearch">
               <div id ="divSearchForm" style="padding-left: 150px;">
                <br/>
                <span>Postcode</span>
                <input type="text" id="postcode" name="postcode" tabindex="4" title="Postcode" class="field" style="width:100px; height:20px;margin:0 0 0 0px;">
                <span class="eg">e.g. SE21 8AA</span>
                <input name="addressSearch" id="addressSearch" tabindex="5" class="button" value="Find address" type="button">
               </div><br/>
               <div id="divSearchResults" style="padding-left: 150px;">

               </div>
              </div>

              <div id="divSelectedAddressClient" style="padding-left: 50px;"></div><br/>
             </div>
            </div>
<!--            </div>  -->
           </fieldset>
          </form>
         <!-- ########################## END FORM CODE HERE -->
        </div>
       </div>
       <div id="pageBottom">&nbsp;</div>
      </div>
      <div id="column_nav">
       <form name="categoryNavigation" action="http://www.southwark.gov.uk/site/scripts/documents.php" method="get" >
        <h2>Choose a topic...</h2>
        <p>
         <label class="hidden" for="categoryNavigation">Select a category</label>
         <span class="selectBorder">
          <select name="categoryID" id="categoryNavigation">
           <option  value="100001" >Advice and benefits</option>
           <option  value="100002" >Business</option>
           <option  value="100003" >Community and living</option>
           <option  value="200017" >Children and families</option>
           <option  value="100004" >Council and democracy</option>
           <option  value="100005" >Education and learning</option>
           <option  value="100006" >Environment</option>
           <option  value="100010" >Health and social care</option>
           <option  value="100007" >Housing</option>
           <option  value="100008" >Jobs and careers</option>
           <option  value="100009" >Leisure and culture</option>
           <option  value="200074" >Planning</option>
           <option  value="200079" >Regeneration</option>
           <option  value="100011" >Transport and streets</option>
          </select>
         </span>
         <input value="Go" type="submit" class="button" id="categoryAdditionalButton" />
        </p>
       </form>

       <ul>
        <li ><a title="Pay for it" href="http://www.southwark.gov.uk/payforit">Pay for it</a></li>
        <li ><a title="Apply for it" href="http://www.southwark.gov.uk/applyforit">Apply for it</a></li>
        <li ><a title="Report it" href="http://www.southwark.gov.uk/reportit">Report it</a></li>
        <li ><a title="Request it" href="http://www.southwark.gov.uk/requestit">Request it</a></li>
        <li ><a title="Say it" href="http://www.southwark.gov.uk/info/200218/say_it">Say it</a></li>
       </ul>
      </div>
      <div class="clear"></div>
      <div class="contactDetails">
       <h2>Contact us</h2>
       <p>Southwark Council<br />
        PO BOX 64529<br />
        London SE1P 5LX
       </p>
       <p>020 7525 5000</p>
       <p><a href="mailto:csc@southwark.gov.uk">csc@southwark.gov.uk</a></p>
       <p><a href="http://www.southwark.gov.uk/contact">More contacts...</a></p>
      </div>
      <div class="getInvolvedLinks">
       <h2>Get involved</h2>
       <ul>
        <li><a href="http://www.southwark.gov.uk/feedback">Give your feedback</a></li>
        <li><a href="http://www.southwark.gov.uk/consultations">Consultations</a></li>
        <li><a href="http://www.southwark.gov.uk/meetings">Meetings and minutes</a></li>
       </ul>
      </div>
      <div class="followUs">
       <h2>Follow us <span><a href="http://www.southwark.gov.uk/followUs">What is this?</a></span></h2>
       <ul>
        <li><a href="http://www.southwark.gov.uk/rss/news"><img src="https://www.southwark.gov.uk/site/images/rssIcon.gif" alt="RSS feed" /></a></li>
        <li><a href="http://www.youtube.com/southwarkcouncil"><img src="https://www.southwark.gov.uk/site/images/youtubeIcon.gif" alt="youTube channel" /></a></li>
        <li><a href="http://twitter.com/lb_southwark"><img src="https://www.southwark.gov.uk/site/images/twitterIcon.gif" alt="twitter account" /></a></li>
        <li><a href="http://www.facebook.com/group.php?gid=39375476380#/pages/London-United-Kingdom/London-Borough-of-Southwark/37117884425?ref=share"><img src="https://www.southwark.gov.uk/site/images/facebookIcon.gif" alt="facebook fan" /></a></li>
        <li><a href="http://www.flickr.com/photos/southwarkcouncil/"><img src="https://www.southwark.gov.uk/site/images/flickrIcon.gif" alt="flickr photostream" /></a></li>
       </ul>
      </div>
      <div class="webChat">
       <!-- <h2><a href="#"><strong>Web chat</strong> with customer services</a></h2>-->
      </div>
      <div class="clear"></div>
     </div>
     <div id="footer">
      <p class="backToTheTop"><a href="#mast">&uarr; Back to the top</a></p>
      <p><a href="http://www.southwark.gov.uk/site_map">Site map</a> | <a href="http://www.southwark.gov.uk/terms">Terms &amp; Privacy</a> | <a href="http://www.southwark.gov.uk/statistics">Website statistics</a> | <a href="http://www.southwark.gov.uk/foi">Freedom of information</a> | &copy; 2010 Southwark Council</p>
     </div>
    </div>
   </div>

   <!-- START OF eVisitAnalyst CODE -->

<script language="JavaScript" type="text/javascript">
var ID_section_15243615 = "";//Place section here.
var ID_tt_15243615 = "t";
var ID_uid_15243615 = "17410";
</script>
<script src="http://extra.evisitanalyst.com/eva.js" type="text/javascript">
</script>
<noscript><img src="http://extra.evisitanalyst.com/eva51/collect/?userid=17410&tt=t" border="0" alt="eVisit" width="1" height="1"></noscript>

<!-- END OF eVisitAnalyst CODE -->
<!-- START OF Google Analytics CODE -->

<script  type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ?  "https://ssl." : "http://www.");
document.write(unescape("%3Cscript  src='" + gaJsHost + "google-analytics.com/ga.js'  type='text/javascript'%3E%3C/script%3E"));
</script>

<script  type="text/javascript">
var pageTracker =  _gat._getTracker("UA-5215817-1");
pageTracker._trackPageview();
</script>

<!-- END OF Google Analytics CODE -->

  </body>

</html>
