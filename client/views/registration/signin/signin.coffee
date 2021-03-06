Template.signin.events
  "click .github-btn": ()->
    Meteor.loginWithGithub
      requestPermissions:["user"]
      requestOfflineToken:true
      , (error) ->
        if error
          console.log error.reason 
        else
          Router.go "/"


  "click #signin-btn": (e,t)->
    e.preventDefault()	
    email = t.$("#signin-email").val()
    password = t.$("#signin-password").val()
    if email and password
      Meteor.loginWithPassword(email,password,(error)->
        if error
          Materialize.toast(error.reason, 2000)
        else
          Router.go "/"
         
      )
    else
      Materialize.toast('Email / Password may not be empty', 2000)

  "keypress #signin-email, keypress #signin-password": (e,t)->
    email = t.$("#signin-email").val()
    password = t.$("#signin-password").val()
    if e.which is 13 and email and password
      t.$('#signin-btn').trigger('click')
