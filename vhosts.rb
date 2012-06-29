require 'formula'

class Vhosts < Formula
   homepage 'https://github.com/noisedev/ccg'
   url 'git@github.com:noisedev/brewery.git', :using => :git
   version 'git'

   depends_on 'noise/brewery/mamp'

   def install
      prefix.install 'vhosts/httpd-vhosts.conf'
      system "cp #{prefix}/httpd-vhosts.conf /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf"
      system 'sed -i "" "s/#Include \/Applications\/MAMP\/conf\/apache\/extra\/httpd-vhosts.conf/Include \/Applications\/MAMP\/conf\/apache\/extra\/httpd-vhosts.conf/" /Applications/MAMP/conf/apache/httpd.conf'

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
