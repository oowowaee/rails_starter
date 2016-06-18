== README

This README would normally document whatever steps are necessary to get the
application up and running.

**Checkout repo**

**Configuration**

  Ideally you should install the Chrome extension for Rails Panel (see debugging section).

  To run in the production environment, you'll need to 
      export SECRET_KEY_BASE=

**Creating a user**

  You can create one from the command line:
  
    u = User.new({password: 'abcdefg', name: 'Patrick', email: 'patrick@sucks.com', role: 2})
    u.confirm

  Or in app/models/user.rb

    Add :registerable to the following line:
    devise :database_authenticatable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
    Restart the server
    You should see a 'signup' link under the login form.

**Database creation**

    I created two databases: site, and site_test.  
    Both using the user information contained in the config/database.yml

**Testing**
  
    bundle exec rake spec
    OR
    bundle exec rspec path/to/test/file

    There is a commented out block in the spec_helper.rb file.
    changing this will cause the browser to open during E2E tests.

**Delayed Job** [Link](https://github.com/collectiveidea/delayed_job)

    Call .delay.method(params) on any object and it will be processed in the background.

    RAILS_ENV=production bin/delayed_job start
    RAILS_ENV=production bin/delayed_job stop

    # Runs two workers in separate processes.
    RAILS_ENV=production bin/delayed_job -n 2 start
    RAILS_ENV=production bin/delayed_job stop

    # Set the --queue or --queues option to work from a particular queue.
    RAILS_ENV=production bin/delayed_job --queue=tracking start
    RAILS_ENV=production bin/delayed_job --queues=mailers,tasks start

    # Use the --pool option to specify a worker pool. You can use this 
    # option multiple times to start different numbers of workers for different queues.
    # The following command will start 1 worker for the tracking queue,
    # 2 workers for the mailers and tasks queues, and 2 workers for any jobs:
    RAILS_ENV=production bin/delayed_job --pool=tracking --pool=mailers,tasks:2 --pool=*:2 start

    # Runs all available jobs and then exits
    RAILS_ENV=production bin/delayed_job start --exit-on-complete
    # or to run in the foreground
    RAILS_ENV=production bin/delayed_job run --exit-on-complete

**Debugging/Testing**

  Byebug
  
  [Simplecov](https://github.com/colszowka/simplecov) (Report can be found at /coverage/index.html)
      
  [Rails Panel](https://github.com/dejan/rails_panel) [(Install from Chrome webstore)](https://chrome.google.com/webstore/detail/railspanel/gjpfobpafnhjhbajcjgccbbdofdckggg)
      
  [Mailcatcher](https://github.com/sj26/mailcatcher)
      http://127.0.0.1:1080
      
  Rspec
  
  Capybara        
      [Cheat sheet](https://gist.github.com/zhengjia/428105)


**Other tools**

  [sublime 3](https://www.sublimetext.com/3)
  [zenhub](https://www.zenhub.com/)
  [How to link issue with commit on github](http://stackoverflow.com/questions/1687262/link-to-the-issue-number-on-github-within-a-commit-message)