# My assignments
query {   
  myassignments(
    userId:"9676bf1e-acce-4b97-a0cf-3028df2e76f0" )
  {

   id
   stageName
   account{
     number
     name
   }
   staff{
     firstName
     lastName
   }
   task{
     name
   }
   report{
     comments
   }

  
 }
}

query($userId: String!) {
    myassignments(userId: $userId) {
      id
      stageName
      account {
        number
        name
      }
      staff {
        firstName
        lastName
      }
      task {
        name
      }
      report {
        comments
      }
    }
  }

# my tasks (from my department)
query {   
  mytasks(
    userId:"9676bf1e-acce-4b97-a0cf-3028df2e76f0" )
  {
	 
      id
      name
      staffs {
        id
        firstName
        lastName
      }
  
   
 }
}
# another way to query
query($userId: String!) {
    mytasks(userId: $userId ) {
      name
      myTotalAssignments(userId: $userId)
    }
  }

# get tototal stats for user
 query {
    stages {
      name
      myTotalAssignments(userId: "9676bf1e-acce-4b97-a0cf-3028df2e76f0")
    }
  }

#   get total assignments by task type
query {   
  tasks
    
  {
	 name
   myTotalAssignments(userId:"9676bf1e-acce-4b97-a0cf-3028df2e76f0" ) 
 }
}

# My report
query($userId: String!) {
    myreports(userId: $userId) {
    id
    comments
    completed
    furtherAction{
      name
      other{
        name
      }
    }
    
    }
  }
# All reports
query {
  	reports {
    id
    comments
    completed
    furtherAction{
      name
      other{
        name
      }
    }
    
    }
  }

#########################################################################
#####################   MUTATIONS  ######################################
#########################################################################

# create report
mutation{
  createReport(
  input:{
    completed:true,
    comments:"no isses",
    furtherActionId: "06723a70-c4d8-4fbc-97e8-cb368c1267f3",
    assignmentId: "1c7f578b-56fe-4493-bad7-b9468601451e",
    otherComment: "",
    picture:"iVBORw0KGgoAAAANSUhEUgAAAPoAAAD6CAMAAAC/MqoPAAAAz1BMVEUAAADU\nBy/DDi7dAzDdAzDdAzDdAzDDDi7DDi7DDi7dAzDdAzDdAzDDDi7DDi7DDi7d\nAzDdAzDdAzDDDi7DDi7DDi7dAzDdAzDDDi7DDi7dAzDdAzDDDi7DDi7dAzDD\nDi7fEz3HHTvugZjhh5f97/L78PLqYn7////aaHz74OX44eXmQmTSSmL3wMvw\nw8vhI0rLLEjyobHppbHdAzDDDi7jMlfOO1XoUnHWWW/50Nj00tjscYvdd4nw\nkaTllqT0sL7stL7hRGPXBjDWBi/FDS4+JsiBAAAARXRSTlMAMDAwj9///9+P\nIHDPz3AgEGC/v2AQUK+vUJ/v75+AgP////////////////////////9AQP//\n////////////////r6+TKVt1AAAH7ElEQVR4AezUtaHDUBTA0I9mZtx/zHDM\nWOY+nQ3U6AsAAAAAAAAAAAAA8Em+f9Ts/v3713TDVK7esh3tRr9xPV+d7iCM\ntCf9KU5SJcKzXOvonaIU313VmjZK7zRtKXtsY/qI1OlZ9rN7Jb2rlza9IHS0\nJfoSV9D0wlxboa8oElljO5HeTU/C2E6kC5heN7Yz6QKm143tTLqA6QXrYzub\n/pxeKmFsV2buQllxZQ3DcJZ1jwuMS7AYGmx84Jy97/+exjNGWLv+zvst+O7g\nKfnrha6Kna4/ethhq9wUvdIf99G7EV8407xp1zpHevTuff8JrqN//3H/8PgP\nG0/njx5/2Hg6f/T4w8bTj/bo3ahKNWjdXpC76ty7B/9vMXz9Qbic+0cTOGz2\nJanRChw94LC55svyvPDNd5VH7+zrQQc2zPORJ/bi5ekhD5t94/zLJoAcOHrE\nYTNs+pU+M/CAowccNmBl/m1zD646evxhQ7f4Tl96cvzRW1WHjVs3/7HfswY6\nemv+v0Vy/Yo+oOnUP5rVT1F8SUVPeTnz8/bMaZZV8ipr+J1GDSeiD3/RRyJ6\n1HTW+2bImWoTifxFY3pLQp/+Tp9J6G2eDuZMtflx0mMFffEnfamgd0g6nzNk\n1vD0R8qcUWZN86BdKXNGmTXr5jknzBlp1gC/4YQ5I82aqPkuZDkjzZprAL0l\nyxlp1rQB+mNY/iqv3WuY/gSgx6qc0WZNB6DflDWstGbvAPSVKGfEWbM+Ono3\n2UdPezAdmCZn1FkTERPlDJ81PP0WKH+TX7K3oPw2Qm8pckadNW2Efi7IGXnW\nXEfosSBn5FnTQej3+ZzRZ80DhL7ic0afNWuEfsbnjD5rTiNkfM7osyZi9pzO\nGX3WvIDoLTpn9FnTJul8zvBZw9NjOmf0WdNh6XzOLJZs1vD0R6qcGU9UWfMU\noq9EOfPO+feirFlD9HuinMmcL4CsYZ9e+Kb5sGtMus730nxnH4mioXYhyZmN\nc95vJVlzDaO3JA1bfqXPJTXbxuiPFTkzdV/pfqbImicYPVa8ML75Tn+reHvs\nYPSbgpwZuu90PxJkzR2MvhLkTL+iDwRZsz4a+qZG163ovXx3W4AOjc+Zhavo\nfslnTcQNz5l8/Is+ybms4em36Jx5537R/Xs6a26D9BadM9nv9ILOmjZIfwbn\nTNL9nd5L4ax5CdJjOGcW7ne6X8JZ0wHp9+HHpvJP+hx+hHoA0ldszkzdn3Q/\nY7NmDdLP2JzJ/qYXbNacRuDQnBnufrVghGZNRA7Nmf4ufUBlDU9vkY9N5S59\nTj5CtVk6mDMLt0v3SyhreHoMPjaN6+gT8BGqw9K5nBm6OrofAVmD0YEHmP/V\neLJ6epHv7v/804t9Kyxnkm49vZdiWbNG6Tewhl24erpfYjV7N0JH5Uxe7qPP\ncyprInYXzAtjle+79PqQH/BPL+a1oJzJ9tMLKGvaMP0xkzNDt5/uR0zWPIHp\nsZ3+ri7f6+n7Q/69nd6h6UjO5OVl9HkOZA1PXyE5s3CX0f0SyZo1TSdyJh9f\nTp/kQNbg9IjImaG7nO5HRNZE9Iicyf6LXgBZw9NvWXMG2wB9etE3zZCjj/RF\nQz7AZDm4wvj0Qi825gw4W9Z0cPp9W86gm9ieXuitbDmDzpQ1a5x+ZsoZeHP+\n6cUye85ws2RNdEh6N8fXOyi9pc8ZImvaB6UnPD09KD3W5wyRNR09nW9YpmYV\n9Ed8zlg24Z9e8KaZaugzumgMu6HPGSJr7kaC6XOGyJpIsQs+Z/isuSaht4Jz\npj+u3z+TPRsEZ01bQn8cmjOJ27N/9wrS0Kx5IqHHoTmzsdO3oVnT0dMtOVPa\n6XN71ijpq8CcmTo73c8Cs2atpxtyJguhF/asEdKjsJxJXAjdp2FZE2kWljOb\nMPrWnjVC+q2gnCnD6HN71tBPL4am6RuOXEU3HroBXzTIA0xiOHIV3XjoUvLp\nxbA4IGcSF0r3aUDWdET0+wE5swmnbwOy5oGIvgr42FAZTp8HfK5oLaKf2XNm\n6sLpfmbPmtNINPvHhrIm9ML+uaJINXPOJK4J3afmrJHRW8aGzTfN6NvcWLNt\nHd362FQ2o8+tj1A6emz8duLUNaP7mfErjJ0D0DPDkTPQC+MjlI7+yJYziWtK\n96kta57K6Ctbzmya07e2rFnL6Ddsj01lc/rc9gh1N5LNlDNT15zuZ6asiXS7\nsDw2ZQS9sDxCXRPSW4acSRxB96kha9pC+mNDzmwY+taQNU+E9NjwKeiSoc8N\nH5fuXDW97NctcwzdF4O6za+avvrcnl3Y6A5DQRS+PzMzF5FUMO/139KSeJmO\nNdLe08EIvsR29+e9Of3n1TkdyXt6kI1OvtPP00CbX12n3zZBNzw6Tr/MokTV\n0m36qo5SbTtO0/uHYAO8k79ulHfy143yTv66Ud6J183VO/G6uXonWDfeu1P5\n6WdWN9478brhtZYlp6+a4VTVKTW9X4dbi1OJ6ed1/DwD78Tr5uqdeN1cvROv\nm6t34nVz9U68bq7eidfN1Tvxurl6J0A3h6rxb0yfELrxLTo/nd5ndDPwTj66\nAeOP359+YYfzDZffm74CWTfwTrxurt6J183VO/G6uXonXjdX78Tr5uqdeN1c\nvROvm6t3ctYNGN9+ffoAGG7XcPdy+t5aN+BxWvxjsat3InTz79E7PekWQPbe\nyV83qOG//7PI/mhZlmVZlmVZlmVZlmXZPZmSvHpA7pEOAAAAAElFTkSuQmCC\n",
    
  }
  ){
    report{
      id
    }
  }
}

mutation(
    $userId: String!
    $staffId: String!
    $taskId: String!
    $accountIds: [String!]!
  ) {
    createAssignment(
      input: {
        userId: $userId
        staffId: $staffId
        taskId: $taskId
        accountIds: $accountIds
      }
    ) {
      assignments {
        id
      }
    }
  }