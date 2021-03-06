//toast
const GreetingToast = function (message) {
  iziToast.show({
    timeout: 2000,
    icon: 'far fa-smile-wink',
    position: 'center',
    progressBar: false,
    closeOnClick: true,
    close: false,
    backgroundColor: '#d0d7dd',
    maxWidth: '80%',
    displayMode: 'replace',
    transitionIn: 'fadeIn',
    transitionInMobile: 'fadeIn',
    message: message,
  });
}

const ShareLinkWindow = function (url) {
  var message = '<b>Share Link</b>' + '<br>';
  iziToast.question({
    id: 'question',
    backgroundColor: '#d0d7dd',
    icon: 'fas fa-share-alt',
    iconColor: '#788185',
    timeout: false,
    layout: 4,
    overlay: true,
    close: false,
    displayMode: 'once',
    zindex: 999,
    progressBar: false,
    message: message +'<input type="text" id="ShareLink" value="' + url + '"onclick="this.select();">',
    messageLineHeight: '25px',
    position: 'center',
    buttons: [
      ['<button><b>COPY</b></button>', function (instance, toast) {
        var copyTarget = document.getElementById("ShareLink");
        copyTarget.select();
        document.execCommand("Copy");
        instance.hide({ transitionOut: 'fadeOut' }, toast);
      }],
      ['<button>CANSEL</button>', function (instance, toast) {
        instance.hide({ transitionOut: 'fadeOut' }, toast);
      }],
    ],
    onOpening: function(instance, toast){
      document.body.classList.toggle('nav-open');
    }
  });
}

// Survicate (www.survicate.com) code
const FeedbackWindow = function () {
  document.body.classList.remove('nav-open');;
  var opt = { forceDisplay: true };
  _sva.destroyVisitor(_sva.retarget);
  _sva.showSurvey('f0c0f94b89400d0f', opt);
};