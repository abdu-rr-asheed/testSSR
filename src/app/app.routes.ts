import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: '',
    loadComponent: () =>
      import('./page/page-one/page-one.component').then(
        (m) => m.PageOneComponent
      ),
  },
  {
    path: 'two',
    loadComponent: () =>
      import('./page/page-two/page-two.component').then(
        (m) => m.PageTwoComponent
      ),
  },
];
