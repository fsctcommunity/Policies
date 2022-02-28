# fs-mac-assesment
this policies inclues a set of scripts to work with Forescout, you are free to try and test this scripts and policies.

<b>Mode to use</b>
 Step 1:  Add all the scripts  located in the script folder to your Forescout Installation
 Step 2: Install the policies -  1.3.2 Mac OS assesment . Policies.xml
 Step3 : Disable, or remove allt he policies that you dont need and tune it according your needs.

 Important Note: this Sets of policies are not made by Forescout, but it follow the best practice, all of them uese a last condition called "Irresolvable" but you can change it to investigate in order to see why it fail in some endpoints, 

 Know Issues: 
    - Some Policies Run irresolvable due module is not present - Work Arround : Add a second condition on each policy where the value return is blank or any value
    - Some Policies exit with status code 0 
        Fix: check taht you are using the latest version of the Mac OS plugin  and is running.