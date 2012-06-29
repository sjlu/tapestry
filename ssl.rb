require 'formula'

class Ssl < Formula
   homepage 'https://github.com/noisedev/ccg'
   url 'git@github.com:noisedev/brewery.git', :using => :git
   version 'git'

   depends_on 'noise/brewery/mamp'

   def install
      system 'openssl genrsa 1024 -des3 > server.key'
      #system 'openssl req -config ./openssl.cnf -new -key server.key -out server.csr'
      system './ssl/openssl.sh'
      system 'openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt'
      prefix.install 'server.key', 'server.csr', 'server.crt'

      if !File.exists?("/Applications/MAMP/conf/apache/server.crt")
         #prefix.install Dir['*']
         system "ln -s #{prefix}/server.* /Applications/MAMP/conf/apache/"
      else
         opoo "Certificates already there, not touching it."
      end

      system 'sed -i "" "s/#Include \/Applications\/MAMP\/conf\/apache\/extra\/httpd-ssl.conf/Include \/Applications\/MAMP\/conf\/apache\/extra\/httpd-ssl.conf/" /Applications/MAMP/conf/apache/httpd.conf'

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
