import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { GraphComponent } from './graph.component';

describe('GraphComponent', () => {
  let component: GraphComponent;
  let fixture: ComponentFixture<GraphComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GraphComponent ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(GraphComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
