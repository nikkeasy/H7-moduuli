saltconfigured:
  group.absent
  
admin: 
  user.absent:
    - purge: True

testuser: 
  user.absent:
    - purge: True

saltyuser: 
  user.absent: 
    - purge: True
