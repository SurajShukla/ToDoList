require 'spec_helper'

describe Forecast do
  let(:json) do
    {'forecast' =>
     {'simpleforecast' =>
      {'forecastday' =>
       [
         {'date' =>
          {
            "day"=>1,
            "month"=>1,
            "year"=>2015
          },
          "icon_url"=>"http://icons.wxug.com/i/c/k/partlycloudy.gif"
       },
       {'date' =>
        {
          "day"=>1,
          "month"=>11,
          "year"=>2015
        },
        "icon_url"=>"http://icons.wxug.com/i/c/k/cloudy.gif"
       }
       ]
      }
     }
    }
  end
  let(:forecast_day) { json['forecast']['simpleforecast']['forecastday']}

  describe "::ten_day_forecast" do

    context 'when environment variable is set' do
      it 'returns ten day forecasts' do
        allow(described_class).to receive(:consume).with(anything())
        stub_const("Forecast::WEATHER_UNDERGROUND_API_KEY", 'axx')

        expect(described_class).to receive(:consume).with(anything())
        described_class.ten_day_forecast('wb', 'Kolkata')
      end
    end

    context 'when environment variable is not set' do
      it 'returns ten day forecasts' do
        allow(described_class).to receive(:consume).with(anything())
        stub_const("Forecast::WEATHER_UNDERGROUND_API_KEY", nil)

        expect { described_class.ten_day_forecast('wb', 'Kolkata') }.to raise_error(Forecast::EnvironmentVarMissing)
      end
    end
  end

  describe "::get_forecast_days" do
    it 'returns forecast days' do
      expect(described_class.get_forecast_days(json)).to eq(json['forecast']['simpleforecast']['forecastday'])
    end
  end

  describe "::get_date" do
    it 'returns date' do
      expect(described_class.get_date(forecast_day.first)).to eq(Date.new(2015,1,1))
    end
  end

  describe "::get_icon" do
    it 'returns icon url' do
      expect(described_class.get_icon(forecast_day.first)).to include('partlycloudy.gif')
    end
  end

  describe "::consume" do
    let(:hash) do
      {
       Date.new(2015, 1, 1) => 'http://icons.wxug.com/i/c/k/partlycloudy.gif',
       Date.new(2015, 11, 1) => 'http://icons.wxug.com/i/c/k/cloudy.gif'
      }
    end

    it 'returns hash of date and image urls' do
      expect(described_class.consume(json)).to eq(hash)
    end
  end
end
