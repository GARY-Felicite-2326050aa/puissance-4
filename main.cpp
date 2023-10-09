#include <iostream>

using namespace std;

void pierreFeuilleC()
{
    int j1,j2,p1=0,p2=0;

    for(int i=1;i<=3;i++)
    {
        cout << "rentrez 1 pour pierre,2 pour feuille,3 pour ciseau \n";
        cin >> j1;
        cin >> j2;
        if((j1==1 && j2 == 2 )|| (j1== 2 && j2 == 3)||(j1==3 && j2 ==1))
        {
            p2 += 1;
            cout << "point pour le joueur 2"<<endl;
        }
        else if((j1 == 1 && j2 == 3)||(j1==3 && j2==2)||(j1==2 && j2==1))
        {
            p1 += 1;
            cout << "point pour le joueur 1"<<endl;
        }
    }
    if(p2<p1)
    {
        cout<<"le joueur 1 a gagné" << endl;
    }
    else if(p1<p2)
    {
        cout <<"le joueur 2 a gagné" << endl;
    }
    else
    {
        cout << "égalité"<<endl;
    }


}

int main()
{
    pierreFeuilleC();
    return 0;
}
