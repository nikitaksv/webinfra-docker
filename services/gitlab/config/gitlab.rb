gitlab_rails['ldap_enabled'] = true
gitlab_rails['ldap_servers'] = {
'main' => {
  'label' => 'GitLab LDAP',
  'host' =>  'ldap',
  'port' => 389,
  'uid' => 'uid',
  'attributes' => {
    'username' => 'uid',
    'email' => ['mail','mailalias'],
    'first_name' => 'givenName',
    'last_name' => 'sn',
    'name' => 'uid'
  },
  'encryption' => 'plain',
  'allow_username_or_email_login' => true,
  'verify_certificates' => true,
  'bind_dn' => 'uid=git,ou=services,dc=nindeco,dc=com',
  'password' => 'defender',
  'active_directory' => true,
  'base' => 'OU=people,DC=nindeco,DC=com',
  'user_filter' => '(&(objectClass=posixAccount)(memberof=cn=users,ou=groups,dc=nindeco,dc=com))'
  }
}
nginx['custom_gitlab_server_config'] = "location /_archive  {\n proxy_pass http://gitlab-workhorse/nindeco/_archive.git;\n}\nlocation /2thewine  {\n proxy_pass http://gitlab-workhorse/nindeco/2thewine.git;\n}\nlocation /vizadobro.ms  {\n proxy_pass http://gitlab-workhorse/nindeco/vizadobro.ms.git;\n}\nlocation /publisher  {\n proxy_pass http://gitlab-workhorse/nindeco/publisher.git;\n}\nlocation /ilikon  {\n proxy_pass http://gitlab-workhorse/nindeco/ilikon.git;\n}\nlocation /apiship  {\n proxy_pass http://gitlab-workhorse/nindeco/apiship.git;\n}\nlocation /test  {\n proxy_pass http://gitlab-workhorse/nindeco/test.git;\n}\nlocation /briz2006  {\n proxy_pass http://gitlab-workhorse/nindeco/briz2006.git;\n}\nlocation /pricelt  {\n proxy_pass http://gitlab-workhorse/nindeco/pricelt.git;\n}\nlocation /ivankalinin  {\n proxy_pass http://gitlab-workhorse/nindeco/ivankalinin.git;\n}\nlocation /limainvest  {\n proxy_pass http://gitlab-workhorse/nindeco/limainvest.git;\n}\nlocation /___publisher  {\n proxy_pass http://gitlab-workhorse/nindeco/___publisher.git;\n}\nlocation /ivankalinin.new  {\n proxy_pass http://gitlab-workhorse/nindeco/ivankalinin.new.git;\n}\nlocation /xtool  {\n proxy_pass http://gitlab-workhorse/nindeco/xtool.git;\n}\nlocation /trackgo  {\n proxy_pass http://gitlab-workhorse/nindeco/trackgo.git;\n}\nlocation /ghc.new  {\n proxy_pass http://gitlab-workhorse/nindeco/ghc.new.git;\n}\nlocation /apiship.geocoder  {\n proxy_pass http://gitlab-workhorse/nindeco/apiship.geocoder.git;\n}\nlocation /unitte.server  {\n proxy_pass http://gitlab-workhorse/nindeco/unitte.server.git;\n}\nlocation /ilizium  {\n proxy_pass http://gitlab-workhorse/nindeco/ilizium.git;\n}\nlocation /publisher.tovar  {\n proxy_pass http://gitlab-workhorse/nindeco/publisher.tovar.git;\n}\nlocation /general.bafuslib  {\n proxy_pass http://gitlab-workhorse/nindeco/general.bafuslib.git;\n}\nlocation /newpricelt  {\n proxy_pass http://gitlab-workhorse/nindeco/newpricelt.git;\n}\nlocation /vizadobro  {\n proxy_pass http://gitlab-workhorse/nindeco/vizadobro.git;\n}\nlocation /general.wovns  {\n proxy_pass http://gitlab-workhorse/nindeco/general.wovns.git;\n}\nlocation /nindeco.new  {\n proxy_pass http://gitlab-workhorse/nindeco/nindeco.new.git;\n}\nlocation /matchtv  {\n proxy_pass http://gitlab-workhorse/nindeco/matchtv.git;\n}\nlocation /sedau  {\n proxy_pass http://gitlab-workhorse/nindeco/sedau.git;\n}\nlocation /general.fastsystem  {\n proxy_pass http://gitlab-workhorse/nindeco/general.fastsystem.git;\n}\nlocation /bafus  {\n proxy_pass http://gitlab-workhorse/nindeco/bafus.git;\n}\nlocation /instrument  {\n proxy_pass http://gitlab-workhorse/nindeco/instrument.git;\n}\nlocation /postcraft  {\n proxy_pass http://gitlab-workhorse/nindeco/postcraft.git;\n}\nlocation /adamandeva  {\n proxy_pass http://gitlab-workhorse/nindeco/adamandeva.git;\n}\nlocation /testgkh  {\n proxy_pass http://gitlab-workhorse/nindeco/testgkh.git;\n}\nlocation /masterblesk  {\n proxy_pass http://gitlab-workhorse/nindeco/masterblesk.git;\n}\nlocation /cementcrm  {\n proxy_pass http://gitlab-workhorse/nindeco/cementcrm.git;\n}\nlocation /unitte_yii  {\n proxy_pass http://gitlab-workhorse/nindeco/unitte_yii.git;\n}\nlocation /papi.advego  {\n proxy_pass http://gitlab-workhorse/nindeco/papi.advego.git;\n}\nlocation /siteofnovel  {\n proxy_pass http://gitlab-workhorse/nindeco/siteofnovel.git;\n}\nlocation /yii2-model-history-behavior  {\n proxy_pass http://gitlab-workhorse/nindeco/yii2-model-history-behavior.git;\n}\nlocation /task-nindeco-com  {\n proxy_pass http://gitlab-workhorse/nindeco/task-nindeco-com.git;\n}\nlocation /general.wpmobiletest  {\n proxy_pass http://gitlab-workhorse/nindeco/general.wpmobiletest.git;\n}\nlocation /general.ecwid  {\n proxy_pass http://gitlab-workhorse/nindeco/general.ecwid.git;\n}\nlocation /crm  {\n proxy_pass http://gitlab-workhorse/nindeco/crm.git;\n}\nlocation /opspost  {\n proxy_pass http://gitlab-workhorse/nindeco/opspost.git;\n}\nlocation /roulette  {\n proxy_pass http://gitlab-workhorse/nindeco/roulette.git;\n}\nlocation /papi.tovar  {\n proxy_pass http://gitlab-workhorse/nindeco/papi.tovar.git;\n}\nlocation /testrepo  {\n proxy_pass http://gitlab-workhorse/nindeco/testrepo.git;\n}\nlocation /general.dockerdummy  {\n proxy_pass http://gitlab-workhorse/nindeco/general.dockerdummy.git;\n}\nlocation /kbmikronika  {\n proxy_pass http://gitlab-workhorse/nindeco/kbmikronika.git;\n}\nlocation /servicecrm  {\n proxy_pass http://gitlab-workhorse/nindeco/servicecrm.git;\n}\nlocation /general.tests  {\n proxy_pass http://gitlab-workhorse/nindeco/general.tests.git;\n}\nlocation /ergosdk  {\n proxy_pass http://gitlab-workhorse/nindeco/ergosdk.git;\n}\nlocation /papi.gimage  {\n proxy_pass http://gitlab-workhorse/nindeco/papi.gimage.git;\n}\nlocation /open  {\n proxy_pass http://gitlab-workhorse/nindeco/open.git;\n}\nlocation /fairwind  {\n proxy_pass http://gitlab-workhorse/nindeco/fairwind.git;\n}\nlocation /parkofficems  {\n proxy_pass http://gitlab-workhorse/nindeco/parkofficems.git;\n}\nlocation /general.yiinicms  {\n proxy_pass http://gitlab-workhorse/nindeco/general.yiinicms.git;\n}\nlocation /papi.vesta  {\n proxy_pass http://gitlab-workhorse/nindeco/papi.vesta.git;\n}\nlocation /papi  {\n proxy_pass http://gitlab-workhorse/nindeco/papi.git;\n}\nlocation /ghc  {\n proxy_pass http://gitlab-workhorse/nindeco/ghc.git;\n}\nlocation /ghc.src  {\n proxy_pass http://gitlab-workhorse/nindeco/ghc.src.git;\n}\nlocation /general  {\n proxy_pass http://gitlab-workhorse/nindeco/general.git;\n}\nlocation /papi.docker  {\n proxy_pass http://gitlab-workhorse/nindeco/papi.docker.git;\n}\nlocation /matchtv.config  {\n proxy_pass http://gitlab-workhorse/nindeco/matchtv.config.git;\n}\nlocation /fitnesscrm  {\n proxy_pass http://gitlab-workhorse/nindeco/fitnesscrm.git;\n}\nlocation /general.onefaq  {\n proxy_pass http://gitlab-workhorse/nindeco/general.onefaq.git;\n}\nlocation /nindeco-site  {\n proxy_pass http://gitlab-workhorse/nindeco/nindeco-site.git;\n}\nlocation /xtool.old  {\n proxy_pass http://gitlab-workhorse/nindeco/xtool.old.git;\n}\nlocation /ouuoru  {\n proxy_pass http://gitlab-workhorse/nindeco/ouuoru.git;\n}\nlocation /postcraft.src  {\n proxy_pass http://gitlab-workhorse/nindeco/postcraft.src.git;\n}\nlocation /fitnesscrm.src  {\n proxy_pass http://gitlab-workhorse/nindeco/fitnesscrm.src.git;\n}\nlocation /papi.download  {\n proxy_pass http://gitlab-workhorse/nindeco/papi.download.git;\n}\nlocation /mozhnovse  {\n proxy_pass http://gitlab-workhorse/nindeco/mozhnovse.git;\n}\nlocation /mayel  {\n proxy_pass http://gitlab-workhorse/nindeco/mayel.git;\n}\nlocation /unitte.client  {\n proxy_pass http://gitlab-workhorse/nindeco/unitte.client.git;\n}\nlocation /general.yii2-nicms  {\n proxy_pass http://gitlab-workhorse/nindeco/general.yii2-nicms.git;\n}\n"