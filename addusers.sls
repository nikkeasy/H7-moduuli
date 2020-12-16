
saltconfigured: 
  group.present

admin: 
  user.present:
    - fullname: admin
    - shell: /bin/zsh
    - home: /home/admin
    - groups:
      - saltconfigured

testuser: 
   user.present:
    - fullname: testikäyttäjä
    - shell: /bin/zsh
    - home: /home/testuser
    - groups:
      - saltconfigured

saltyuser: 
  user.present: 
    - fullname: suolainen käyttäjä
    - shell: /bin/zsh
    - home: /home/saltyuser
    - groups:
      - saltconfigured
