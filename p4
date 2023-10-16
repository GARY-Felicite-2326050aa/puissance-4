#include <iostream>
#include <vector>
#include <iomanip>
using namespace std;

constexpr int h = 7;
constexpr int l = 7;

bool testDroite(const vector<vector<int>> & tab, const size_t & i, const size_t & j){
   if(tab.at(i).at(j)==tab.at(i+1).at(j) && i<4 ){ //Vérifie si la 1ere case à droite est la même que celle ciblée
       if(tab.at(i).at(j)==tab.at(i+2).at(j)){
           if(tab.at(i).at(j)==tab.at(i+3).at(j) || tab.at(i).at(j)==tab.at(i-1).at(j)){
               return true;
           }
       }

   }
   return false;
}

bool testGauche(const vector<vector<int>> & tab, const size_t & i, const size_t & j){
   if(tab.at(i).at(j)==tab.at(i-1).at(j) && i>2){ //Vérifie si la 1ere case à gauche est la même que celle ciblée
       if(tab.at(i).at(j)==tab.at(i-2).at(j)){
           if(tab.at(i).at(j)==tab.at(i-3).at(j) || tab.at(i).at(j)==tab.at(i+1).at(j)){
               return true;
           }
       }

   }
   return false;
}

bool testBas(const vector<vector<int>> & tab, const size_t & i, const size_t & j){
   if(tab.at(i).at(j)==tab.at(i).at(j+1) && j<3){ //Vérifie si la 1ere case EN BAS  est la même que celle ciblée
       if(tab.at(i).at(j)==tab.at(i).at(j+2)){
           if(tab.at(i).at(j)==tab.at(i).at(j+3) || tab.at(i).at(j)==tab.at(i).at(j-1)){
               return true;
           }
       }

   }
   return false;
}

bool testDiago1(const vector<vector<int>> & tab, const size_t & i, const size_t & j){
   if(tab.at(i).at(j)==tab.at(i-1).at(j-1) && j>2 && i>2 && tab.at(i).at(j)==tab.at(i-2).at(j-2) && tab.at(i).at(j)==tab.at(i-2).at(j-3) ) return true; //Vérifie si la diagonale 1 (du haut gauche) est la même que celle ciblée
   if(tab.at(i).at(j)==tab.at(i-1).at(j-1) && j>1 && i>1 && tab.at(i).at(j)==tab.at(i-2).at(j-2) && tab.at(i).at(j)==tab.at(i+1).at(j+1) ) return true;
   return false;
}

bool testDiago2(const vector<vector<int>> & tab, const size_t & i, const size_t & j){
   if(tab.at(i).at(j)==tab.at(i-1).at(j+1) && j<3 && i>2 && tab.at(i).at(j)==tab.at(i-2).at(j+2) && tab.at(i).at(j)==tab.at(i-2).at(j+3) ) return true; //Vérifie si la diagonale 2 (du bas gauche) est la même que celle ciblée
   if(tab.at(i).at(j)==tab.at(i-1).at(j+1) && j<4 && i>1 && tab.at(i).at(j)==tab.at(i-2).at(j+2) && tab.at(i).at(j)==tab.at(i+1).at(j-1) ) return true;
   return false;
}

bool testDiago3(const vector<vector<int>> & tab, const size_t & i, const size_t & j){
   if(tab.at(i).at(j)==tab.at(i+1).at(j+1) && j<3 && i<4 && tab.at(i).at(j)==tab.at(i+2).at(j+2) && tab.at(i).at(j)==tab.at(i+2).at(j+3) ) return true; //Vérifie si la diagonale 3 (du bas droite) est la même que celle ciblée
   if(tab.at(i).at(j)==tab.at(i+1).at(j+1) && j<4 && i<5 && tab.at(i).at(j)==tab.at(i+2).at(j+2) && tab.at(i).at(j)==tab.at(i-1).at(j-1) ) return true;
   return false;
}

bool testDiago4(const vector<vector<int>> & tab, const size_t & i, const size_t & j){
   if(tab.at(i).at(j)==tab.at(i+1).at(j-1) && j>2 && i<4 && tab.at(i).at(j)==tab.at(i+2).at(j-2) && tab.at(i).at(j)==tab.at(i+2).at(j-3) ) return true; //Vérifie si la diagonale 3 (du bas droite) est la même que celle ciblée
   if(tab.at(i).at(j)==tab.at(i+1).at(j-1) && j>1 && i<5 && tab.at(i).at(j)==tab.at(i+2).at(j-2) && tab.at(i).at(j)==tab.at(i-1).at(j+1) ) return true;
   return false;
}

int testVictoire(const vector<vector<int>> & tab, const size_t & i, const size_t & j){
   if(testDroite(tab,i,j)==true || testGauche(tab,i,j)==true || testBas(tab,i,j)==true ||testDiago1(tab,i,j)==true || testDiago2(tab,i,j)==true ||testDiago3(tab,i,j)==true || testDiago4(tab,i,j)==true) return true;
   return false;
}






int test (vector<vector<int>> & tab, const int & i) {
    int j = 6;
    const string a = "err colone pleine !";
    while(true) {
        if (j < 0){
            if (tab.at(j).at(i) != 0) {
            //TABLEAU DEPASSER ERREUR
            }

        }
        if (tab.at(j).at(i) == 0) {return j;}

        j=j-1;
    }
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
                tab.at(test(tab,i-1)).at(i-1)= 1;
                j1 = false;
                j2 = true;
                aff(tab);
                if(testVictoire(tab,i+1,test(tab,i+1)) == true) {cout<< "LE JOUEUR 1 A GEGNER ";}
            } else {
                cout << "ERR: vous ne pouvez pas placer votre pion ici !" << endl;
            }


        }
        if (j2==true) {
            cout << "Choisi ta colone J2 :"<< endl;
            cin >> i;
            if (i-1 <= 6) {
                tab.at(test(tab,i-1)).at(i-1)= 2;
                j2 = false;
                j1 = true;
                aff(tab);
                testVictoire(tab,i+1,test(tab,i+1));
            } else
            {
                cout << "ERR: vous ne pouvez pas placer votre pion ici !" << endl;
            }

        }

    }

    return 0;


}

