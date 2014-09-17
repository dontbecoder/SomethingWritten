/*********************************************************************************************************************
			÷	��	��	�� 	V1.0
			

                copyright by Huangda 2011.4

*********************************************************************************************************************/
/***********���Կ���******************/
//#define		 DEBUG		

/*******************************************/
#include<stdio.h>
#include<math.h>
/********************************************************************************************************************/
#define KING		(0)
#define FIRE		(3)
#define MU		(2)
#define WATER	(1)
#define TU		(4)

int month =0;// 3;
int day = 0;//17;
int time = 0;//11;	ʱ��
int time_hour = 0;//����
	
int qian[]={1,1,1};
int dui[] ={0,1,1};
int li[]  ={1,0,1};
int zhen[]={0,0,1};
int xun[] ={1,1,0};
int kan[] ={0,1,0};
int gen[] ={1,0,0};
int kun[] ={0,0,0};

int Shang_gua, Xia_gua;

int Yao_dong;
int Ti_gua, Yong_gua;



int Get_Shanggua();
int Get_Xiagua();
int Get_Yaodong();
void Get_Ti_Yong_gua();
int Get_wuxing(int x);
void Meihuayishu(int T_gua ,int Y_gua);
int *GuaXu_2_Gua(int x);
int Output_gua(int num);
/********************************************************************************************************************/
int Get_wuxing(int x)
{
	int wuxing;

 switch(x)
 {
	case 1:
	case 2:
		wuxing= KING;
		break;
	case 3:
		wuxing = FIRE;
		break;
	case 4:
	case 5:
		wuxing = MU;
		break;
	case 6:
		wuxing = WATER;
		break;
	case 7:
	case 8:
		wuxing = TU;
		break;
	 default:
			break;
 }
       return wuxing;
}
int *GuaXu_2_Gua(int x)
{
   int *ba_gua;
   
switch(x)
 {
	case 1:
		ba_gua =qian;
		break;
	case 2:
		ba_gua= dui;
		break;
	case 3:
		ba_gua = li;
		break;
	case 4:
		ba_gua =zhen;
		break;
	case 5:
		ba_gua = xun;
		break;
	case 6:
		ba_gua = kan;
		break;
	case 7:
		ba_gua = gen;
		break;
	case 8:
		ba_gua = kun;
		break;
		default:
			break;
 }
   return ba_gua;
   }
int Gua_2_GuaXu(int *x)
{
	int i;
	int j = 0;
       int GuaXu=0;
	   
	while(1)
	{
	/********** 			1		**********/
	for(i=0;i<3;i++)
	{
         if(x[i]==qian[i])
         	{
         	j++;
         	}
	}
	if(j==3)
		{
		GuaXu = 1;
		break;
	      }
	j=0;
		/*********		2 		***********/
	for(i=0;i<3;i++)
	{
         if(x[i]==dui[i])
         	{
         	j++;
         	}
	}
	if(j==3)
		{
		GuaXu = 2;
		break;
	      }
	j=0;
	/***********		3				*********/
	for(i=0;i<3;i++)
	{
         if(x[i]==li[i])
         	{
         	j++;
         	}
	}
	if(j==3)
		{
		GuaXu = 3;
		break;
	      }
	j=0;
	/********			4			************/
		for(i=0;i<3;i++)
	{
         if(x[i]==zhen[i])
         	{
         	j++;
         	}
	}
	if(j==3)
		{
		GuaXu = 4;
		break;
	      }
	j=0;
	/********			5			************/
	for(i=0;i<3;i++)
	{
         if(x[i]==xun[i])
         	{
         	j++;
         	}
	}
	if(j==3)
		{
		GuaXu = 5;
		break;
	      }
	j=0;
	/********			6			************/
	for(i=0;i<3;i++)
	{
         if(x[i]==kan[i])
         	{
         	j++;
         	}
	}
	if(j==3)
		{
		GuaXu = 6;
		break;
	      }
	j=0;
	/*********			7		***********/
	for(i=0;i<3;i++)
	{
         if(x[i]==gen[i])
         	{
         	j++;
         	}
	}
	if(j==3)
		{
		GuaXu = 7;
		break;
	      }
	j=0;
	/*********			8			***********/
	for(i=0;i<3;i++)
	{
         if(x[i]==kun[i])
         	{
         	j++;
         	}
	}
	if(j==3)
		{
		GuaXu = 8;
		break;
	      }
	}

	return GuaXu;
}
void Bian_Gua(int x)
{
   int i;
   int He_gua[]={0,0,0,0,0,0}; 
   int Shang_g[]={0,0,0};
   int Xia_g[]={0,0,0};
   x = x-1;
   for( i=0;i<3;i++)
  {
   He_gua[i] = GuaXu_2_Gua(Shang_gua)[i];
   	}
      for( i=0;i<3;i++)
  {
   He_gua[i+3] = GuaXu_2_Gua(Xia_gua)[i];
   	}
/*	  printf("\n He_gua 1st\n");
  for( j=0;j<6;j++)
  	{printf("%d ",He_gua[j]);}
  */
	  if(He_gua[5-x] == 0)
	  	{
		He_gua[5-x] =1;
	        }
	  else
	  	{
              He_gua[5-x] =0;
	       }
/*	printf("\n He_gua 2nd\n");
  for( j=0;j<6;j++)
  	{printf("%d ",He_gua[j]);}
*/
	for(i=0;i<3;i++)
	{
	Shang_g[i] = He_gua[i];
	}
	Shang_gua=Gua_2_GuaXu(Shang_g);

	for(i=0;i<3;i++)
	{
	Xia_g[i] = He_gua[i+3];
	}
	 Xia_gua = Gua_2_GuaXu(Xia_g);
		
//	printf("\n %d %d\n",Shang_gua,Xia_gua);

	
}
int get_shichen(int time_hour_input)
{
	int time_shichen;
	switch(time_hour_input)
	{
	case 1:
	case 2:
		time_shichen = 2;
		break;
	case 3:
	case 4:
		time_shichen = 3;
		break;
	case 5:
	case 6:
		time_shichen = 4;
		break;		
	case 7:
	case 8:
		time_shichen = 5;
		break;
	case 9:
	case 10:
		time_shichen = 6;
		break;
	case 11:
	case 12:
		time_shichen = 7;
		break;
	case 13:
	case 14:
		time_shichen = 8;
		break;
	case 15:
	case 16:
		time_shichen = 9;
		break;
	case 17:
	case 18:
		time_shichen = 10;
		break;
	case 19:
	case 20:
		time_shichen = 11;
		break;
	case 21:
	case 22:
		time_shichen = 12;
		break;
	case 23:
	case 0:
		time_shichen = 1;
		break;		
	}
	return time_shichen ;
}

int Get_Shanggua()
{
      Shang_gua = (4 + month + day) % 8;
      if(Shang_gua ==0)
      {
       Shang_gua = 8;
      }
	  return Shang_gua;
}
int  Get_Xiagua()
{
      Xia_gua = ((4 + month + day) + time)%8;
      if(Xia_gua == 0)
      {
      	Xia_gua = 8;
        }
	  return Xia_gua;
}
int Get_Yaodong()
{
       Yao_dong = ((4 + month + day) + time) %6;
       if(Yao_dong ==0)
       {
       Yao_dong = 6;
       }

	   return Yao_dong;
}
void Get_Ti_Yong_gua(int sh_g, int xia_g)
{

       if(Yao_dong<=3)
       	{
       	Ti_gua = sh_g;
       	Yong_gua = xia_g;
       	}
       else
       	{
       	Ti_gua = xia_g;
       	Yong_gua = sh_g;
       	}


}
void Meihuayishu(int T_gua ,int Y_gua)
{

   if( (abs(T_gua -Y_gua)==1) )                                  /*       ����*/
   	{
              if(T_gua<Y_gua)
                     {
                     printf(" Ti ---> Yong      ������\n");
            		}
            	   else
            	   	{
            		printf(" Yong ---> Ti      ������\n");
            	       }
       }
   else if ((abs(T_gua -Y_gua)==4)  )
     {
        if(T_gua>Y_gua)
                     {
                     printf(" Ti ---> Yong     ������\n");
            		}
            	   else
            	   	{
            		printf(" Yong ---> Ti    ������\n");
            	       }

     }
   else if( (abs(T_gua -Y_gua)==2) )				/*         ���         */
   {
            if(T_gua<Y_gua)
                     {
                     printf(" Ti ---XXX--> Yong  �����\n");
            		}
            	   else
            	   	{
            		printf(" Yong ---XXX--> Ti  �ÿ���\n");
            	       }
    

    }
   	   else if(  (abs(T_gua -Y_gua)==3)   )
     {
                      if(T_gua>Y_gua)
                     {
                     printf(" Ti ---XXX--> Yong  �����\n");
            		}
            	   else
            	   	{
            		printf(" Yong ---XXX--> Ti  �ÿ���\n");
            	       }
   }
   else											/*	     ��ͬ		*/
   	{

          printf(" Yong ====== Ti  ����ͬ��\n");
      }
   	
}
void output_wuxing(int x)
{
 switch(x)
 {
	case 0:
		printf(" ��");
		break;
	case 1:
		printf(" ˮ");
		break;
	case 2:
		printf(" ľ");
		break;
	case 3:
		printf(" ��");
		break;
	case 4:
		printf(" ��");
		break;

	 default:
			break;
 }
}
int Output_gua(int num)
{
	switch(num)
	{
	case 1:
		printf("\n Ǭ\n");
		break;
	case 2:
		printf("\n ��\n");
		break;
	case 3:
		printf("\n ��\n");
		break;
	case 4:
		printf("\n ��\n");
		break;
	case 5:
		printf("\n ��\n");
		break;	
	case 6:
		printf("\n ��\n");
		break;
	case 7:
		printf("\n ��\n");
		break;
	case 8:
		printf("\n ��\n");
		break;	
		
	default:
		break;
	}
}
int main()
{
int sh_g;
int xia_g;
int yao_d;
int password ;
int choice;
char ch;
char pswd[3]={0};
char license[3]="520";
int i=0;
printf("\n**************  Welcome to Mei Hua Yi Shu *****************\n");
printf("\n                            Copyright by Huangda 2011.4                          \n");
printf("\n*******************************************************\n");
/**********************************/
printf("\n �������л��ʦ'��������'�Ĵ���֧��\n");
printf("\n");
	system("pause");
printf("\n ��Ȩ���У�δ�������ô���\n");
/**********************************/
printf("\n ������ʹ������:\n");

	//scanf("%d",&password);
    while((ch = getch())!='\r')
    {
	putchar('*');
	pswd[i] = ch;
	i++;
	}
	//if(password!=520)
	
	if ( (pswd[0]==53)&&(pswd[1]==50)&&(pswd[2]==48) )	
		{
	printf("\n��ӭʹ��\n");	
	 system("Pause");
/******			GUI 			*********/
loop:
printf("\n ������ũ����: \n");
   scanf("%d",&month);
   if((month<1)||(month>12))
   {
        printf("�������,��������˳�!\n");
		getch();
		exit(0);
   }
   else
   	{
  	//  system("Pause");
   	}

printf("\n ������ũ����: \n");
   scanf("%d",&day);
   if((day<1)||(day>31))
   {
        printf("�������,��������˳�!\n");
		getch();
		exit(0);
   }
   else
   	{
  	//  system("Pause");
   	}

printf("\n ������ʱ��(24Сʱ��): \n");
   scanf("%d",&time_hour);
   if((time_hour<0)||(time_hour>23))
   {
        printf("�������,��������˳�!\n");
		getch();
        exit(0);
   }
   else
   	{
  	//  system("Pause");
   	}   
/***************/
		}
	else
		{
	printf("\n�����������Ȩʹ��\n");
		getch();
        exit(0);
		
	 }
//##����
  	sh_g =   Get_Shanggua();

	time = get_shichen(time_hour);
//##����
     xia_g = Get_Xiagua();
#ifdef DEBUG
	printf("shang, xia  is %d %d \n",sh_g,xia_g);
#endif
//##س��
     yao_d = Get_Yaodong();	
//��������
    Get_Ti_Yong_gua(sh_g,xia_g);
#ifdef DEBUG
	   printf(" Ti , Yong is %d %d \n",Ti_gua,Yong_gua);
#endif
//##����
	printf("\n     ����   \n");
	   printf("����");
	  Output_gua(Ti_gua);
      output_wuxing(Get_wuxing(Ti_gua));
	  printf("\n");
	  printf("����");
	  Output_gua(Yong_gua);
	  output_wuxing(Get_wuxing(Yong_gua));
	  printf("\n");
      Meihuayishu(Get_wuxing(Ti_gua), Get_wuxing( Yong_gua));
printf("\n **************** �����ָ��� *******************************\n");
#ifdef DEBUG
	printf("\n س is %d \n",yao_d);
#endif
	Bian_Gua(yao_d);
//##����
       Get_Ti_Yong_gua(Shang_gua,Xia_gua);
	printf("\n     ���� \n");
		   printf("����");
	  Output_gua(Ti_gua);	   
      output_wuxing(Get_wuxing(Ti_gua));
	  printf("\n");
	  printf("����");
	  Output_gua(Yong_gua);
	  output_wuxing(Get_wuxing(Yong_gua));
	   printf("\n");
	Meihuayishu(Get_wuxing(Ti_gua),Get_wuxing(Yong_gua));

	 printf("\n��лʹ�ã���ѡ��:\n");
     printf("1����1����\n");
	 printf("2����������˳�\n");


//printf("\n %d\n",getch());
	 if(getch()==49)
	 	{
           goto loop;
	    }
	 else 
	 	{
		exit(0);
	 }

return 0;
}
