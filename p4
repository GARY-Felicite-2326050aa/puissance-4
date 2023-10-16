#include <iostream>
#include <vector>
#include <iomanip>
using namespace std;

constexpr int h = 7;
constexpr int l = 7;

bool testHorizontal(const vector<vector<int>> & tab, const size_t & joueur){
   for(size_t j =0; j<7; j=j+1){
   if(tab.at(3).at(j)==joueur && tab.at(6).at(j)==joueur && tab.at(5).at(j)==joueur && tab.at(6).at(j)==joueur) return true;
   if(tab.at(3).at(j)==joueur && tab.at(2).at(j)==joueur && tab.at(1).at(j)==joueur && tab.at(0).at(j)==joueur) return true;
   }
   return false;
}

bool testVertical(const vector<vector<int>> & tab, const size_t & joueur){
   for(size_t i =0; i<7; i=i+1){
        if(tab.at(i).at(3)==joueur && tab.at(i).at(4)==joueur && tab.at(i).at(5)==joueur && tab.at(i).at(6)==joueur) return true;
        if(tab.at(i).at(3)==joueur && tab.at(i).at(2)==joueur && tab.at(i).at(1)==joueur && tab.at(i).at(0)==joueur) return true;
        }
        return false;
   return false;
}

bool testDiagonale(const vector<vector<int>> & tab, const size_t & joueur){
    //Diagonale 1 (haut gauche)
    for(size_t i =3; i<7; i=i+1){
       for(size_t j=0 ; j<4 ; j=j+1){
        if(tab.at(i).at(j)==joueur && tab.at(i-1).at(j+1)==joueur && tab.at(i-2).at(j+2)==joueur && tab.at(i-3).at(j+3)==joueur) return true; }}
    //Diagonale 2 (haut droite)
    for(size_t i =0; i<4; i=i+1){
        for(size_t j=0 ; j<4 ; j=j+1){
         if(tab.at(i).at(j)==joueur && tab.at(i+1).at(j+1)==joueur && tab.at(i+2).at(j+2)==joueur && tab.at(i+3).at(j+3)==joueur) return true; }}
    //Diagonale 3 (bas droite)
    for(size_t i =0; i<4; i=i+1){
        for(size_t j=3; j<7 ; j=j+1){
         if(tab.at(i).at(j)==joueur && tab.at(i+1).at(j-1)==joueur && tab.at(i+2).at(j-2)==joueur && tab.at(i+3).at(j-3)==joueur) return true; }}
    //Diagonale 4 (bas gauche)
    for(size_t i =3; i<7; i=i+1){
        for(size_t j=3; j<7 ; j=j+1){
         if(tab.at(i).at(j)==joueur && tab.at(i-1).at(j-1)==joueur && tab.at(i-2).at(j-2)==joueur && tab.at(i-3).at(j-3)==joueur) return true; }}
    return false;
    }



int testVictoire(const vector<vector<int>> & tab, const size_t & joueur){
   if(testHorizontal(tab, joueur)==true || testVertical(tab, joueur)==true || testDiagonale(tab, joueur) == true) return true;
   return false;
}
size_t test (vector<vector<int>> & tab, const int & i) {
    int j = 6;

    while(true) {
        if (j < 0){
            break;
        }

        if (tab.at(j).at(i) == 0) {return j;}

        j=j-1;

    }
    return 0;
}
void aff(vector<vector<int>> & tab) {
    srand(time(nullptr));
    for (auto &item : tab) {
        for (auto &j : item) {
            cout << setw(2) << j;
        }
        cout << endl;
    }
    cout <<endl;
}
int main()
{
    int i;
    bool j1 = true;
    bool j2 = false;
    //CREER LE JEUX AVEC QUE DES 0
    vector<vector<int> > tab(l, vector<int> (h, 0));

    srand(time(nullptr));
    for (auto &item : tab) {
        for (auto &i : item) {
            i = 0;
        }
    }
    //JEUX + REMPLISSAGE DU JEUX
    aff(tab);

    while (true) {

        if (j1==true) {
            cout << "Choisi ta colone J1 :"<< endl;
            cin >> i;

            if (i-1 <= 6) {
                if(tab.at(0).at(i-1) != 0) {
                    cout<<"err"<<endl;

                } else {
                tab.at(test(tab,i-1)).at(i-1)= 1;
                j1 = false;
                j2 = true;
                aff(tab);
                if(testVictoire(tab, 1) == true) {
                    cout<< "LE JOUEUR 1 A GAGNE ";
                    break;
                }
            } else {
                cout << "ERR: vous ne pouvez pas placer votre pion ici !" << endl;
            }



        }
        if (j2==true) {
            cout << "Choisi ta colone J2 :"<< endl;
            cin >> i;
            if (i-1 <= 6) {
                if(tab.at(0).at(i-1) != 0) {
                    cout<<"err"<<endl;

                }else {
                tab.at(test(tab,i-1)).at(i-1)= 2;
                j2 = false;
                j1 = true;
 
                aff(tab);
                if(testVictoire(tab, 2) == true) {
                    cout<< "LE JOUEUR 2 A GAGNE ";
                    break;
                }
            } else {
                cout << "ERR: vous ne pouvez pas placer votre pion ici !" << endl;
            }

        }

    }

    return 0;


}

