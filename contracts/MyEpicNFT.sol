// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";
//import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
// Precisamos importar essa funcao de base64 que acabamos de criar
import { Base64 } from "./libraries/Base64.sol";


contract MyEpicNFT is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

    // Add struct definition here
  struct PokemonData {
    string url;
    string name;
  }

  // Add the arrays for Grass, Water, and Fire Pokémon
  PokemonData[] grassPokemons;
  PokemonData[] waterPokemons;
  PokemonData[] firePokemons;

  string private baseURI;
  string baseSvgStart = "<svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'><image x='10' y='20' width='100' height='100' xlink:href='";
  string baseSvgMiddle = "'/><image x='125' y='20' width='100' height='100' xlink:href='";
  string baseSvgEnd = "'/><image x='240' y='20' width='100' height='100' xlink:href='";



  //string baseSvg = "<svg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'> <defs> <linearGradient id='Gradient1'> <stop class='stop1' offset='0%'/> <stop class='stop2' offset='50%'/> <stop class='stop3' offset='100%'/> </linearGradient> </defs> <style> .base { fill: blue; font-family: serif; font-size: 20px; color: #FFF; } .stop1 { stop-color: green; } .stop2 { stop-color: white; stop-opacity: 0; } .stop3 { stop-color: yellow; } </style> <rect width='100%' height='100%' fill='url(#Gradient1)' /> <text x='50%' y='50%' class='base' dominant-baseline='middle' text-anchor='middle'>";

  constructor() ERC721 ("ChavesNFT", "CHAVO") {
    initializePokemons();
    console.log("Initializing Pokemons array");
  }

  function initializePokemons() private {
    
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/1.png", "Bulbasaur"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/2.png", "Ivysaur"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/3.png", "Venusaur"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/43.png", "Oddish"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/44.png", "Gloom"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/45.png", "Vileplume"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/69.png", "Bellsprout"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/70.png", "Weepinbell"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/71.png", "Victreebel"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/102.png", "Exeggcute"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/103.png", "Exeggutor"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/114.png", "Tangela"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/152.png", "Chikorita"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/153.png", "Bayleef"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/154.png", "Meganium"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/182.png", "Bellossom"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/187.png", "Hoppip"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/188.png", "Skiploom"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/189.png", "Jumpluff"));
    grassPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/191.png", "Sunkern"));

    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/7.png", "Squirtle"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/8.png", "Wartortle"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/9.png", "Blastoise"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/54.png", "Psyduck"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/55.png", "Golduck"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/60.png", "Poliwag"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/61.png", "Poliwhirl"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/62.png", "Poliwrath"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/72.png", "Tentacool"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/73.png", "Tentacruel"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/79.png", "Slowpoke"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/80.png", "Slowbro"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/90.png", "Shellder"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/91.png", "Cloyster"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/98.png", "Krabby"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/99.png", "Kingler"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/116.png", "Horsea"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/117.png", "Seadra"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/120.png", "Staryu"));
    waterPokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/121.png", "Starmie"));


    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/4.png", "Charmander"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/5.png", "Charmeleon"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/6.png", "Charizard"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/37.png", "Vulpix"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/38.png", "Ninetales"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/58.png", "Growlithe"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/59.png", "Arcanine"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/77.png", "Ponyta"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/78.png", "Rapidash"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/126.png", "Magmar"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/136.png", "Flareon"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/155.png", "Cyndaquil"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/156.png", "Quilava"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/157.png", "Typhlosion"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/218.png", "Slugma"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/219.png", "Magcargo"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/240.png", "Magby"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/244.png", "Entei"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/250.png", "Ho-Oh"));
    firePokemons.push(PokemonData("https://raw.githubusercontent.com/marcusvinicius178/sprites/master/sprites/pokemon/255.png", "Torchic"));

  }

    

  function pickRandomGrassPokemon(uint256 tokenId) public view returns (PokemonData memory) {
    uint256 rand = random(string(abi.encodePacked("GRASS_POKEMON", Strings.toString(tokenId))));
    rand = rand % grassPokemons.length;
    return grassPokemons[rand];
  }

  function pickRandomWaterPokemon(uint256 tokenId) public view returns (PokemonData memory) {
    uint256 rand = random(string(abi.encodePacked("WATER_POKEMON", Strings.toString(tokenId))));
    rand = rand % waterPokemons.length;
    return waterPokemons[rand];
  }

  function pickRandomFirePokemon(uint256 tokenId) public view returns (PokemonData memory) {
    uint256 rand = random(string(abi.encodePacked("FIRE_POKEMON", Strings.toString(tokenId))));
    rand = rand % firePokemons.length;
    return firePokemons[rand];
  }

  function random(string memory input) internal pure returns (uint256) {
      return uint256(keccak256(abi.encodePacked(input)));
  }

  function makeAnEpicNFT() public {
    uint256 newItemId = _tokenIds.current();

    PokemonData memory grass = pickRandomGrassPokemon(newItemId);
    PokemonData memory water = pickRandomWaterPokemon(newItemId);
    PokemonData memory fire = pickRandomFirePokemon(newItemId);

    // Create an array of Pokémon IDs and call the generateSVG() function
    string[] memory imageUrls = new string[](3);
    imageUrls[0] = grass.url;
    imageUrls[1] = water.url;
    imageUrls[2] = fire.url;

    string memory finalSvg = generateSVG(imageUrls);

    // Combine Pokémon names to create the title of the NFT
    string memory combinedNames = string(abi.encodePacked(grass.name, ", ", water.name, ", ", fire.name));

    // Encode the JSON metadata
    string memory json = Base64.encode(
        bytes(
            string(
                abi.encodePacked(
                    '{"name": "',
                    combinedNames,
                    '", "description": "A unique Pokemon NFT!", "image": "data:image/svg+xml;base64,',
                    Base64.encode(bytes(finalSvg)),
                    '"}'
                )
            )
        )
    );

    // Prefix the metadata with data:application/json;base64
    string memory finalTokenUri = string(
        abi.encodePacked("data:application/json;base64,", json)
    );

    console.log("\n--------------------");
    console.log(finalTokenUri);
    console.log("--------------------\n");


    //string memory json = Base64.encode(bytes(string(abi.encodePacked('{"name": "NFT-', Strings.toString(newItemId), '", "description": "A unique Pokemon NFT!", "image": "data:image/svg+xml;base64,', Base64.encode(bytes(finalSvg)), '"}'))));
    //string memory generatedTokenURI = string(abi.encodePacked("data:application/json;base64,", json));

    console.log("Generated SVG: %s", finalSvg);

    _safeMint(msg.sender, newItemId);
    // Set the dynamically generated token URI
    _setTokenURI(newItemId, finalTokenUri);

    //_setTokenURI(newItemId, generatedTokenURI);
    _tokenIds.increment();

    console.log("An NFT with ID %s has been minted to %s", newItemId, msg.sender);
  }

  function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
    require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

    return bytes(_baseURI()).length > 0 ? string(abi.encodePacked(_baseURI(), Strings.toString(tokenId))) : "";

  }

  function _baseURI() internal view override virtual returns (string memory) {
    return baseURI;
  }

  function generateSVG(string[] memory imageUrls) internal pure returns (string memory) {
    string memory svg = "<svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'>";
    for (uint256 i = 0; i < imageUrls.length; i++) {
      svg = string(abi.encodePacked(svg, "<image x='", Strings.toString(i * 115 + 10), "' y='20' width='100' height='100' xlink:href='", imageUrls[i], "'/>"));
    }
    svg = string(abi.encodePacked(svg, "</svg>"));
    return svg;
  }

}


