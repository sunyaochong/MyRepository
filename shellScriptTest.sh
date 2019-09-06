#!/bin/bash
function test1(){
mist=666888

read -p "make your choice?:" num

if [ $num -eq $mist ];then

	echo "right nice!"
	exit 0;
else 
        echo "wrong! please try again!"
	for (( i=2;i<=3;i=i+1 ))
	do
	       read -p "please try again:" num
               if [ $num -ne $mist  ];then
                     echo "wrong! you only have cost $i time"
		     if [ $i -eq 3 ];then
                         echo "you have try $i times,now shutdown the window!"
			 exit 0;
		     fi
	       else
		     echo "you finally right!"
		     exit 0;
               fi
        done
fi
}

function test2(){
while :
do
	read -p "input number:" num
[[ $num -ge 100 ]] && echo "$num 大于 100" && exit 1 ;
[[ $num -lt 100 ]] && echo "$num 值不够，请重新输入！"
done
}


function test3(){

pwd=123456

while :
do
     read -p "input your choice: " num
     
     number=`echo $num|sed -r 's/[0-9]//g'`
     
     if [ ! -z $number ];then
	     echo "您输入的不是纯数字，请重新输入！"
	     continue
     elif [  $num -eq $pwd ];then
	     echo "输入正确，请进！"
	     break
     else
	    for (( i=2;i<4;i=i+1 ))
            do
		    read -p "try again only left $((4-$i)) chances: " num1
		    if [ $num1 -ne $pwd ];then
			  echo "wrong!only left $((4-$i)) chances!"
			 
			  if [ $i -eq 4 ];then
                                echo "you have alreay try $i time,now shutdown"
				break
		           fi
			   continue
	            else
			  echo "finally access!"
			  exit 1;
		    fi

            done
      fi
done

}

index=0
function test4(){

while :
do
     read -p "input your choice: " num

     number=`echo $num|sed -r 's/[0-9]//g'`

     if [ ! -z $number ];then
             echo "您输入的不是纯数字，请重新输入！"
             continue
     else
	   if [ $index -eq 6 ];then
		   echo "已经尝试6次输入，密码锁定！"
		   exit 0
	    fi

           test5 $num
     fi
     
done
}

function test5(){
passwd=123456
while [ $index -le 5 ]
do
        ((index +=1))
	echo "当前第$index次输入，还剩$((6-$index))机会！"
	if [ $num -eq $passwd ];then

	    echo "right password!"
	    exit 0
	else
	   echo "wrong,try again,当前第$index times"
	   
            test4
	fi

done


}
test4
