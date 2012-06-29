require 'formula'

class Zend < Formula
   homepage 'http://framework.zend.com/download/latest/'
   url 'http://framework.zend.com/releases/ZendFramework-1.11.12/ZendFramework-1.11.12-minimal.tar.gz'
   md5 '457fc5e7ad8e44d066fdcdb658827281'

   depends_on 'noise/brewery/mamp'

   def install
      prefix.install 'library/Zend'
      system "cp -R #{prefix}/Zend /Applications/MAMP/bin/php/php5.3.6/lib/php/"

      ##
      # Time to restart MAMP
      ##
      opoo 'Restarting MAMP, requires root access.'
      system 'sudo /Applications/MAMP/bin/stopApache.sh'
      if `ps aux | grep mysql[d]` != ""
         system 'sudo /Applications/MAMP/bin/stopMysql.sh > /dev/null 2>&1 &'
      end
      system 'sudo /Applications/MAMP/bin/startApache.sh'
      system 'sudo -u $USER /Applications/MAMP/bin/startMysql.sh > /dev/null 2>&1 &'
   end

end
