class AddCreateZivnostJourney < ActiveRecord::Migration[5.2]
  def up
    journey = Journey.create!(
      title: "Založenie živnosti",
      slug: "zalozenie-zivnosti",
      description: "<h1>Založenie živnosti: krok po kroku</h1>
<p>Zistite, čo treba vybaviť na založenie živnosti.</p>
<p>Založenie živnosti zvyčajne trvá 5 až 10 pracovných dní.</p>",
      published_status: "PUBLISHED"
    )

    step = journey.steps.create!(
      title: "Založte si bankový účet",
      slug: "zalozte-si-bankovy-ucet",
      description: "<h1>Založte si bankový účet</h1>
<p>Pri zakladaní živnosti si nemusíte zakladať nový bankový účet – môžete používať Váš osobný účet.</p>
<p>Je to však praktické: oddelíte tak svoje osobné a podnikateľské príjmy a výdavky, čo Vám zjednoduší prácu pri účtovníctve a daňovom priznaní.</p>

<h2>Súvisiace odkazy</h2>
<ul>
 <li><a href='http://www.uspesne-podnikanie.sk/zivnostnik-a-ucet-banke' target='_blank'/>Živnostník (SZČO) a účet v banke</a> (externý zdroj)</li>
 <li><a href='https://mojepodnikanie.sk/ucet/' target='_blank'/>Živnosť – podnikateľský alebo súkromný účet</a> (externý zdroj)</li>
</ul>",
    )

    step.tasks.create!(
      title: "Bankový účet založený",
      type: "SimpleTask",
    )

    step = journey.steps.create!(
      title: "Ohláste svoju živnosť",
      slug: "ohlaste-svoju-zivnost",
      description: "<h1>Ohláste svoju živnosť</h1>
<p>Vaše živnostenské podnikanie je treba ohlásiť Ministerstvu vnútra.</p>
<p>Po úspešnom ohlásení Vám bude pridelené IČO (identifikačné číslo organizácie).</p>
<p>Vyplnenie formulára Vám zaberie asi 10 minút.</p>

<h2>Predtým, než začnete</h2>
<p>Budete potrebovať:</p>
<ul>
 <li>Čipový preukaz (eID) a obslužný softvér</li>
 <li>Webový prehliadač Internet Explorer</li>
</ul>",
    )

    step.tasks.create!(
      title: "Vyplňte formulár",
      type: "ExternalLinkTask",
      url: "/TODO"
    )

    step.tasks.create!(
      title: "Podpíšte",
      type: "SimpleTask",
    )

    step = journey.steps.create!(
      title: "Zaregistrujte sa na DPH",
      slug: "zaregistrojte-sa-na-dph",
      description: "<h1>Zaregistrujte sa na DPH</h1>
<p>Registrácia na daň z pridanej hodnoty (DPH) je povinná len v niektorých prípadoch. Využite našu službu a zistite, či sa potebujete registrovať na DPH.</p>
<p>Po registrácií na DPH vám budú udelené čísla DIČ a IČ DPH.</p>
<p>Vyplnenie formulára Vám zaberie asi 10 minút.</p>

<h2>Predtým, než začnete</h2>
<p>Budete potrebovať:</p>
<ul>
 <li>Čipový preukaz (eID) a obslužný softvér</li>
 <li>Webový prehliadač Internet Explorer</li>
</ul>",
    )

    step.tasks.create!(
      title: "Zistite, či sa potrebujete zaregistrovať na DPH",
      type: "SimpleTask",
    )

    step.tasks.create!(
      title: "Zaregistrujte sa na DPH",
      type: "SimpleTask",
    )
  end

  def down
    journey = Journey.find_by(slug: "zalozenie-zivnosti")
    journey.steps.each do |step|
      step.tasks.map(&:destroy)

      step.destroy
    end

    journey.destroy
  end

end
