import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { MarketLegendComponent } from './market-legend.component';

describe('MarketLegendComponent', () => {
  let component: MarketLegendComponent;
  let fixture: ComponentFixture<MarketLegendComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MarketLegendComponent ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(MarketLegendComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
